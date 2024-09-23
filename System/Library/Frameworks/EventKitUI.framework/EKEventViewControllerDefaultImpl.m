@implementation EKEventViewControllerDefaultImpl

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

- (EKEventViewControllerDefaultImpl)init
{
  EKEventViewControllerDefaultImpl *v2;
  EKEventViewControllerDefaultImpl *v3;
  uint64_t v4;
  NSMutableDictionary *cellHeights;
  void *v6;
  int v7;
  void *v8;
  id v9;
  _QWORD v11[4];
  id v12;
  id location;
  objc_super v14;
  _QWORD v15[4];

  v15[3] = *MEMORY[0x1E0C80C00];
  v14.receiver = self;
  v14.super_class = (Class)EKEventViewControllerDefaultImpl;
  v2 = -[EKEventViewControllerDefaultImpl init](&v14, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_showsPreview = 1;
    v4 = objc_opt_new();
    cellHeights = v3->_cellHeights;
    v3->_cellHeights = (NSMutableDictionary *)v4;

    objc_msgSend(MEMORY[0x1E0D0CDE0], "sharedPreferences");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "hideInlineDayViewInEventDetails");

    if (v7)
      -[EKEventViewControllerDefaultImpl setHideCalendarPreview:](v3, "setHideCalendarPreview:", 1);
    objc_initWeak(&location, v3);
    v15[0] = objc_opt_class();
    v15[1] = objc_opt_class();
    v15[2] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v15, 3);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __40__EKEventViewControllerDefaultImpl_init__block_invoke;
    v11[3] = &unk_1E6018610;
    objc_copyWeak(&v12, &location);
    v9 = (id)-[EKEventViewControllerDefaultImpl registerForTraitChanges:withHandler:](v3, "registerForTraitChanges:withHandler:", v8, v11);
    objc_destroyWeak(&v12);

    objc_destroyWeak(&location);
  }
  return v3;
}

void __40__EKEventViewControllerDefaultImpl_init__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  _QWORD *WeakRetained;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  char v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t i;
  void *v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (!WeakRetained)
    goto LABEL_22;
  v8 = objc_msgSend(v6, "horizontalSizeClass");
  objc_msgSend(v5, "traitCollection");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8 != objc_msgSend(v9, "horizontalSizeClass"))
  {

    goto LABEL_6;
  }
  v10 = objc_msgSend(v6, "verticalSizeClass");
  objc_msgSend(v5, "traitCollection");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "verticalSizeClass");

  if (v10 != v12)
  {
LABEL_6:
    objc_msgSend(WeakRetained, "_statusButtonsContainerView");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (v13)
    {
      WeakRetained[136] = 0;
      objc_msgSend(WeakRetained, "navigationController");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "toolbar");
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      if (v15)
      {
        objc_msgSend(WeakRetained, "_statusButtonsContainerView");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "setBoundsWithToolbar:", v15);

      }
    }
    objc_msgSend(WeakRetained, "_updateNavBarAnimated:", 0);
    objc_msgSend(WeakRetained, "delegate");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_opt_respondsToSelector();

    if ((v18 & 1) != 0)
    {
      objc_msgSend(WeakRetained, "delegate");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(WeakRetained, "_ekEventViewController");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(WeakRetained, "setMinimalMode:", objc_msgSend(v19, "eventViewControllerUseMinimalModeAfterTraitCollectionChange:", v20));

    }
    else
    {
      objc_msgSend(WeakRetained, "setMinimalMode:", 0);
    }
  }
  v21 = objc_msgSend(v6, "userInterfaceStyle");
  objc_msgSend(v5, "traitCollection");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = objc_msgSend(v22, "userInterfaceStyle");

  if (v21 != v23)
  {
    v32 = 0u;
    v33 = 0u;
    v30 = 0u;
    v31 = 0u;
    objc_msgSend(WeakRetained, "items", 0);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
    if (v25)
    {
      v26 = v25;
      v27 = *(_QWORD *)v31;
      do
      {
        for (i = 0; i != v26; ++i)
        {
          if (*(_QWORD *)v31 != v27)
            objc_enumerationMutation(v24);
          objc_msgSend(*(id *)(*((_QWORD *)&v30 + 1) + 8 * i), "reset");
        }
        v26 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
      }
      while (v26);
    }

    objc_msgSend(WeakRetained, "tableView");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "reloadData");

  }
LABEL_22:

}

- (void)_teardownTableView
{
  UITableView *tableView;

  -[UITableView setDelegate:](self->_tableView, "setDelegate:", 0);
  -[UITableView setDataSource:](self->_tableView, "setDataSource:", 0);
  tableView = self->_tableView;
  self->_tableView = 0;

}

- (void)dealloc
{
  void *v3;
  void *v4;
  NSArray *items;
  NSArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  objc_super v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);
  self->_dead = 1;
  -[EKUIRecurrenceAlertController cancelAnimated:](self->_recurrenceAlertController, "cancelAnimated:", 0);
  objc_msgSend((id)EKWeakLinkClass(), "defaultContextManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeContextProvider:", self);

  items = self->_items;
  if (items)
  {
    v15 = 0u;
    v16 = 0u;
    v13 = 0u;
    v14 = 0u;
    v6 = items;
    v7 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v14;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v14 != v9)
            objc_enumerationMutation(v6);
          v11 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * i);
          objc_msgSend(v11, "setDelegate:", 0);
          objc_msgSend(v11, "setEvent:reminder:store:", 0, 0, 0);
        }
        v8 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      }
      while (v8);
    }

  }
  -[EKEventViewControllerDefaultImpl _teardownTableView](self, "_teardownTableView");

  v12.receiver = self;
  v12.super_class = (Class)EKEventViewControllerDefaultImpl;
  -[EKEventViewControllerDefaultImpl dealloc](&v12, sel_dealloc);
}

- (id)tableView
{
  -[EKEventViewControllerDefaultImpl view](self, "view");

  return self->_tableView;
}

- (void)loadView
{
  id v3;
  void *v4;
  id v5;
  double v6;
  double v7;
  double v8;
  double v9;
  UITableView *v10;
  UITableView *tableView;
  double v12;
  void *v13;
  void *v14;
  void *v15;
  NSArray *v16;
  NSArray *tableViewTopConstraints;
  void *v18;
  BOOL v19;
  UIView *v20;
  UIView *headerView;
  EKEventReportJunkView *v22;
  void *v23;
  EKEventReportJunkView *v24;
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
  UIView *v42;
  void *v43;
  void *v44;
  void *v45;
  NSArray *v46;
  NSArray *headerConstraints;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  uint64_t lastAuthorizationStatus;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  _QWORD v61[2];
  void *v62;
  const __CFString *v63;
  _QWORD v64[2];

  v64[1] = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init(MEMORY[0x1E0DC3F10]);
  -[EKEventViewControllerDefaultImpl setView:](self, "setView:", v3);

  -[EKEventViewControllerDefaultImpl view](self, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAutoresizingMask:", 18);

  v5 = objc_alloc(MEMORY[0x1E0DC3D48]);
  v6 = *MEMORY[0x1E0C9D648];
  v7 = *(double *)(MEMORY[0x1E0C9D648] + 8);
  v8 = *(double *)(MEMORY[0x1E0C9D648] + 16);
  v9 = *(double *)(MEMORY[0x1E0C9D648] + 24);
  v10 = (UITableView *)objc_msgSend(v5, "initWithFrame:style:", 0, *MEMORY[0x1E0C9D648], v7, v8, v9);
  tableView = self->_tableView;
  self->_tableView = v10;

  -[UITableView setAccessibilityIdentifier:](self->_tableView, "setAccessibilityIdentifier:", CFSTR("EventDetailsContainer"));
  -[UITableView setDelegate:](self->_tableView, "setDelegate:", self);
  -[UITableView setDataSource:](self->_tableView, "setDataSource:", self);
  -[UITableView setSeparatorStyle:](self->_tableView, "setSeparatorStyle:", !self->_minimalMode);
  if (-[EKEventViewControllerDefaultImpl _reminderMode](self, "_reminderMode"))
    -[EKEventViewControllerDefaultImpl setTopInset:](self, "setTopInset:", 16.0);
  -[UITableView setKeyboardDismissMode:](self->_tableView, "setKeyboardDismissMode:", 1);
  if (EKUIUnscaledCatalyst())
    v12 = EKUIUnscaledCatalystTableRowHeightDefault();
  else
    v12 = *MEMORY[0x1E0DC53D8];
  -[UITableView setRowHeight:](self->_tableView, "setRowHeight:", v12);
  +[EKEventDetailCell detailsCellDefaultHeight](EKEventDetailCell, "detailsCellDefaultHeight");
  -[UITableView setEstimatedRowHeight:](self->_tableView, "setEstimatedRowHeight:");
  -[UITableView setTranslatesAutoresizingMaskIntoConstraints:](self->_tableView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[EKEventViewControllerDefaultImpl view](self, "view");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "addSubview:", self->_tableView);

  _NSDictionaryOfVariableBindings(CFSTR("_tableView"), self->_tableView, 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  _NSDictionaryOfVariableBindings(CFSTR("_tableView"), self->_tableView, 0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3718], "constraintsWithVisualFormat:options:metrics:views:", CFSTR("V:|[_tableView]"), 0, 0, v15);
  v16 = (NSArray *)objc_claimAutoreleasedReturnValue();
  tableViewTopConstraints = self->_tableViewTopConstraints;
  self->_tableViewTopConstraints = v16;

  -[EKEventViewControllerDefaultImpl resetBackgroundColor](self, "resetBackgroundColor");
  -[EKEventViewControllerDefaultImpl event](self, "event");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v18, "couldBeJunk"))
  {
    v19 = -[EKEventViewControllerDefaultImpl minimalMode](self, "minimalMode");

    if (!v19)
    {
      v20 = (UIView *)objc_opt_new();
      headerView = self->_headerView;
      self->_headerView = v20;

      -[UIView setTranslatesAutoresizingMaskIntoConstraints:](self->_headerView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
      v22 = [EKEventReportJunkView alloc];
      -[EKEventViewControllerDefaultImpl _ekEventViewController](self, "_ekEventViewController");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = -[EKEventReportJunkView initWithViewController:](v22, "initWithViewController:", v23);

      -[EKEventReportJunkView setIsLargeDayView:](v24, "setIsLargeDayView:", -[EKEventViewControllerDefaultImpl isLargeDayView](self, "isLargeDayView"));
      -[EKEventReportJunkView setTranslatesAutoresizingMaskIntoConstraints:](v24, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
      -[UIView addSubview:](self->_headerView, "addSubview:", v24);
      v25 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3F10]), "initWithFrame:", v6, v7, v8, v9);
      objc_msgSend(MEMORY[0x1E0DC3658], "tableSeparatorLightColor");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "setBackgroundColor:", v26);

      objc_msgSend(v25, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
      -[UIView addSubview:](self->_headerView, "addSubview:", v25);
      -[EKEventViewControllerDefaultImpl view](self, "view");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "addSubview:", self->_headerView);

      _NSDictionaryOfVariableBindings(CFSTR("_tableView,_headerView,junkView,dividerView"), self->_tableView, self->_headerView, v24, v25, 0);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v63 = CFSTR("onePixel");
      v60 = v14;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", CalOnePixelInPoints());
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v64[0] = v29;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v64, &v63, 1);
      v58 = (void *)objc_claimAutoreleasedReturnValue();

      v30 = (void *)MEMORY[0x1E0CB3718];
      objc_msgSend(MEMORY[0x1E0CB3718], "constraintsWithVisualFormat:options:metrics:views:", CFSTR("V:|[junkView][dividerView(==onePixel)]|"), 0, v58, v28);
      v59 = v15;
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "activateConstraints:", v31);

      v32 = (void *)MEMORY[0x1E0CB3718];
      objc_msgSend(MEMORY[0x1E0CB3718], "constraintsWithVisualFormat:options:metrics:views:", CFSTR("H:|[junkView]|"), 0, 0, v28);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "activateConstraints:", v33);

      v34 = (void *)MEMORY[0x1E0CB3718];
      objc_msgSend(MEMORY[0x1E0CB3718], "constraintsWithVisualFormat:options:metrics:views:", CFSTR("H:|[dividerView]|"), 0, 0, v28);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "activateConstraints:", v35);

      v36 = (void *)MEMORY[0x1E0CB3718];
      objc_msgSend(MEMORY[0x1E0CB3718], "constraintsWithVisualFormat:options:metrics:views:", CFSTR("H:|[_headerView]|"), 0, 0, v28);
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "activateConstraints:", v37);

      v38 = (void *)MEMORY[0x1E0CB3718];
      objc_msgSend(MEMORY[0x1E0CB3718], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", self->_headerView, 8, 0, v24, 8, 1.0, 0.0);
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      v62 = v39;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v62, 1);
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "activateConstraints:", v40);

      v41 = (void *)MEMORY[0x1E0CB3718];
      v42 = self->_headerView;
      -[EKEventViewControllerDefaultImpl view](self, "view");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v41, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v42, 3, 0, v43, 15, 1.0, 0.0);
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      v61[0] = v44;
      objc_msgSend(MEMORY[0x1E0CB3718], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", self->_tableView, 3, 0, self->_headerView, 4, 1.0, 0.0);
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      v61[1] = v45;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v61, 2);
      v46 = (NSArray *)objc_claimAutoreleasedReturnValue();
      headerConstraints = self->_headerConstraints;
      self->_headerConstraints = v46;

      v15 = v59;
      v14 = v60;
      objc_msgSend(MEMORY[0x1E0CB3718], "activateConstraints:", self->_headerConstraints);

      goto LABEL_11;
    }
  }
  else
  {

  }
  objc_msgSend(MEMORY[0x1E0CB3718], "activateConstraints:", self->_tableViewTopConstraints);
LABEL_11:
  v48 = (void *)MEMORY[0x1E0CB3718];
  objc_msgSend(MEMORY[0x1E0CB3718], "constraintsWithVisualFormat:options:metrics:views:", CFSTR("V:[_tableView]|"), 0, 0, v14);
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v48, "activateConstraints:", v49);

  v50 = (void *)MEMORY[0x1E0CB3718];
  objc_msgSend(MEMORY[0x1E0CB3718], "constraintsWithVisualFormat:options:metrics:views:", CFSTR("H:|[_tableView]|"), 0, 0, v14);
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v50, "activateConstraints:", v51);

  if (self->_shouldOverrideAuthorizationStatus)
  {
    lastAuthorizationStatus = self->_lastAuthorizationStatus;
  }
  else
  {
    lastAuthorizationStatus = objc_msgSend(MEMORY[0x1E0CAA078], "realAuthorizationStatusForEntityType:", 0);
    self->_lastAuthorizationStatus = lastAuthorizationStatus;
  }
  if (lastAuthorizationStatus <= 2)
  {
    -[EKEventViewControllerDefaultImpl view](self, "view");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKEventViewControllerDefaultImpl accessDeniedView](self, "accessDeniedView");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v53, "addSubview:", v54);

    -[EKEventViewControllerDefaultImpl view](self, "view");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKEventViewControllerDefaultImpl accessDeniedView](self, "accessDeniedView");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v55, "bringSubviewToFront:", v56);

    if (self->_lastAuthorizationStatus == 1)
    {
      -[EKEventViewControllerDefaultImpl accessDeniedView](self, "accessDeniedView");
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v57, "setMessage:", CFSTR(" "));

    }
  }
  -[EKEventViewControllerDefaultImpl _reloadIfNeeded](self, "_reloadIfNeeded");

}

- (void)resetBackgroundColor
{
  UITableView *tableView;
  void *v4;
  void *v5;
  id v6;

  tableView = self->_tableView;
  objc_msgSend(MEMORY[0x1E0DC3658], "tableBackgroundColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[UITableView setBackgroundColor:](tableView, "setBackgroundColor:", v4);

  objc_msgSend(MEMORY[0x1E0DC3658], "systemBackgroundColor");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[EKEventViewControllerDefaultImpl view](self, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setBackgroundColor:", v6);

}

- (id)_indexPathForSection:(unint64_t)a3
{
  NSArray *currentSections;
  void *v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t v10;

  if (!a3)
    return 0;
  v7 = 0;
  v8 = &v7;
  v9 = 0x2020000000;
  v10 = 0;
  currentSections = self->_currentSections;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __57__EKEventViewControllerDefaultImpl__indexPathForSection___block_invoke;
  v6[3] = &unk_1E601B788;
  v6[4] = &v7;
  v6[5] = a3;
  -[NSArray enumerateObjectsUsingBlock:](currentSections, "enumerateObjectsUsingBlock:", v6);
  objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForRow:inSection:", 0, v8[3]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  _Block_object_dispose(&v7, 8);
  return v4;
}

uint64_t __57__EKEventViewControllerDefaultImpl__indexPathForSection___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  uint64_t result;

  result = objc_msgSend(a2, "tag");
  if (result == *(_QWORD *)(a1 + 40))
  {
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = a3;
    *a4 = 1;
  }
  return result;
}

- (id)_indexPathForAttendeesDetailItem
{
  NSArray *currentSections;
  void *v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t v13;

  v10 = 0;
  v11 = &v10;
  v12 = 0x2020000000;
  v13 = 0;
  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  currentSections = self->_currentSections;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __68__EKEventViewControllerDefaultImpl__indexPathForAttendeesDetailItem__block_invoke;
  v5[3] = &unk_1E601B7D8;
  v5[4] = &v10;
  v5[5] = &v6;
  -[NSArray enumerateObjectsUsingBlock:](currentSections, "enumerateObjectsUsingBlock:", v5);
  objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForRow:inSection:", v7[3], v11[3]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  _Block_object_dispose(&v6, 8);
  _Block_object_dispose(&v10, 8);
  return v3;
}

void __68__EKEventViewControllerDefaultImpl__indexPathForAttendeesDetailItem__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  _QWORD v6[4];
  __int128 v7;
  uint64_t v8;

  objc_msgSend(a2, "items");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __68__EKEventViewControllerDefaultImpl__indexPathForAttendeesDetailItem__block_invoke_2;
  v6[3] = &unk_1E601B7B0;
  v8 = a3;
  v7 = *(_OWORD *)(a1 + 32);
  objc_msgSend(v5, "enumerateObjectsUsingBlock:", v6);

}

void __68__EKEventViewControllerDefaultImpl__indexPathForAttendeesDetailItem__block_invoke_2(_QWORD *a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v7;
  char isKindOfClass;

  v7 = a2;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    *(_QWORD *)(*(_QWORD *)(a1[4] + 8) + 24) = a1[6];
    *(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 24) = a3;
    *a4 = 1;
  }
}

- (id)viewTitle
{
  _BOOL4 v2;
  void *v3;
  void *v4;
  const __CFString *v5;
  void *v6;

  v2 = -[EKEventViewControllerDefaultImpl _reminderMode](self, "_reminderMode");
  EventKitUIBundle();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v2)
    v5 = CFSTR("Reminder Details");
  else
    v5 = CFSTR("Event Details");
  objc_msgSend(v3, "localizedStringForKey:value:table:", v5, &stru_1E601DFA8, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)EKEventViewControllerDefaultImpl;
  -[EKEventViewControllerDefaultImpl viewDidLoad](&v5, sel_viewDidLoad);
  -[EKEventViewControllerDefaultImpl viewTitle](self, "viewTitle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKEventViewControllerDefaultImpl _ekEventViewController](self, "_ekEventViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setTitle:", v3);

  -[EKEventViewControllerDefaultImpl setNeedsReload](self, "setNeedsReload");
  -[EKEventViewControllerDefaultImpl _annotateEventEntityIfNeeded](self, "_annotateEventEntityIfNeeded");
}

- (void)viewWillAppear:(BOOL)a3
{
  void *v4;
  uint64_t v5;
  int64_t lastOrientation;
  int64_t v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  objc_super v20;

  v20.receiver = self;
  v20.super_class = (Class)EKEventViewControllerDefaultImpl;
  -[EKEventViewControllerDefaultImpl viewWillAppear:](&v20, sel_viewWillAppear_, a3);
  -[UITableView setPreservesSuperviewLayoutMargins:](self->_tableView, "setPreservesSuperviewLayoutMargins:", 1);
  -[UIViewController EKUI_viewHierarchy](self, "EKUI_viewHierarchy");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  EKUIPushFallbackSizingContextWithViewHierarchy(v4);
  v5 = objc_msgSend(v4, "ekui_interfaceOrientation");
  lastOrientation = self->_lastOrientation;
  if (v5 != lastOrientation)
  {
    v7 = v5;
    if (lastOrientation)
    {
      -[EKEventViewControllerDefaultImpl view](self, "view");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "bounds");
      v10 = v9;
      v12 = v11;
      v13 = (void *)objc_opt_new();
      -[EKEventViewControllerDefaultImpl viewWillTransitionToSize:withTransitionCoordinator:](self, "viewWillTransitionToSize:withTransitionCoordinator:", v13, v10, v12);

    }
    self->_lastOrientation = v7;
  }
  -[EKEventViewControllerDefaultImpl _updateStatusButtonsActions](self, "_updateStatusButtonsActions");
  -[EKEventViewControllerDefaultImpl _updateResponse](self, "_updateResponse");
  -[EKEventViewControllerDefaultImpl _updateHeaderAndFooterIfNeeded](self, "_updateHeaderAndFooterIfNeeded");
  -[EKEventViewControllerDefaultImpl _indexPathForSection:](self, "_indexPathForSection:", self->_scrollToSection);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (v14)
  {
    -[EKEventViewControllerDefaultImpl tableView](self, "tableView");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "scrollToRowAtIndexPath:atScrollPosition:animated:", v14, 1, 0);

  }
  objc_msgSend((id)EKWeakLinkClass(), "defaultContextManager");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "addContextProvider:", self);

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "addObserver:selector:name:object:", self, sel__localeChanged, *MEMORY[0x1E0D0CA70], 0);
  objc_msgSend(v17, "addObserver:selector:name:object:", self, sel__storeChanged_, *MEMORY[0x1E0CA9F88], 0);
  objc_msgSend(v17, "addObserver:selector:name:object:", self, sel__updateTableContentForSizeCategoryChange_, *MEMORY[0x1E0DC48E8], 0);
  -[EKEventViewControllerDefaultImpl _setObservesKeyboardNotifications:](self, "_setObservesKeyboardNotifications:", 1);
  -[EKEventViewControllerDefaultImpl _updateNavBarAnimated:](self, "_updateNavBarAnimated:", 0);
  -[EKEventViewControllerDefaultImpl _updateResponseVisibility](self, "_updateResponseVisibility");
  -[EKEventViewControllerDefaultImpl navigationController](self, "navigationController");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setNavigationBarHidden:animated:", -[EKEventViewControllerDefaultImpl _shouldShowInlineButtonFromDelegate](self, "_shouldShowInlineButtonFromDelegate"), 0);

  -[EKEventViewControllerDefaultImpl navigationController](self, "navigationController");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setNavigationBarHidden:animated:", -[EKEventViewControllerDefaultImpl _navigationBarShouldBeHidden](self, "_navigationBarShouldBeHidden"), 1);

  -[EKEventTitleDetailItem setHidesTopSeparator:](self->_titleItem, "setHidesTopSeparator:", 1);
  self->_viewIsVisible = 1;
  -[EKEventViewControllerDefaultImpl _reloadIfNeeded](self, "_reloadIfNeeded");
  EKUIPopFallbackSizingContextWithViewHierarchy(v4);

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
  v12.super_class = (Class)EKEventViewControllerDefaultImpl;
  -[EKEventViewControllerDefaultImpl viewDidAppear:](&v12, sel_viewDidAppear_, a3);
  self->_didAppear = 1;
  if (self->_autoPop)
  {
    -[EKEventViewControllerDefaultImpl navigationController](self, "navigationController");
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
  -[EKEventViewControllerDefaultImpl becomeFirstResponder](self, "becomeFirstResponder");
}

- (BOOL)_navigationBarShouldBeHidden
{
  EKEventViewDelegate **p_delegate;
  id WeakRetained;
  id v5;
  char v6;
  id v7;
  void *v8;
  char v9;
  int v11;
  id v12;
  id v13;
  char v14;
  char v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  BOOL v23;

  p_delegate = &self->_delegate;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if ((objc_msgSend(WeakRetained, "conformsToProtocol:", &unk_1EEED6910) & 1) != 0)
  {
    v5 = objc_loadWeakRetained((id *)p_delegate);
    v6 = objc_opt_respondsToSelector();

    if ((v6 & 1) != 0)
    {
      v7 = objc_loadWeakRetained((id *)p_delegate);
      -[EKEventViewControllerDefaultImpl _ekEventViewController](self, "_ekEventViewController");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v7, "eventViewControllerShouldAlwaysShowNavBar:", v8);

      if ((v9 & 1) != 0)
        return 0;
    }
  }
  else
  {

  }
  if (-[EKEventViewControllerDefaultImpl shouldShowEditButtonInline](self, "shouldShowEditButtonInline"))
    LOBYTE(v11) = 1;
  else
    v11 = !-[EKEventViewControllerDefaultImpl _shouldShowEditButton](self, "_shouldShowEditButton");
  v12 = objc_loadWeakRetained((id *)p_delegate);
  if (objc_msgSend(v12, "conformsToProtocol:", &unk_1EEED6910))
  {
    v13 = objc_loadWeakRetained((id *)p_delegate);
    v14 = objc_opt_respondsToSelector();

    if ((v14 & 1) == 0)
    {
      v15 = 0;
      goto LABEL_15;
    }
    v12 = objc_loadWeakRetained((id *)p_delegate);
    v15 = objc_msgSend(v12, "eventViewControllerPresentationWantsHiddenNavBarForSingleController");
  }
  else
  {
    v15 = 0;
  }

LABEL_15:
  -[EKEventViewControllerDefaultImpl navigationController](self, "navigationController");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (v16)
  {
    -[EKEventViewControllerDefaultImpl navigationController](self, "navigationController");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "viewControllers");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v18, "count") == 1)
    {
      -[EKEventViewControllerDefaultImpl navigationController](self, "navigationController");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "viewControllers");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "firstObject");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      -[EKEventViewControllerDefaultImpl _ekEventViewController](self, "_ekEventViewController");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = v21 == v22;

    }
    else
    {
      v23 = 0;
    }

  }
  else
  {
    v23 = 1;
  }

  return v11 & v15 & v23;
}

- (void)viewWillDisappear:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  id WeakRetained;
  void *v7;
  id v8;
  char v9;
  id v10;
  objc_super v11;

  v3 = a3;
  self->_viewIsVisible = 0;
  -[EKEventViewControllerDefaultImpl _setObservesKeyboardNotifications:](self, "_setObservesKeyboardNotifications:", 0);
  -[EKEventViewControllerDefaultImpl navigationController](self, "navigationController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setNavigationBarHidden:animated:", -[EKEventViewControllerDefaultImpl _navigationBarShouldBeHidden](self, "_navigationBarShouldBeHidden"), 1);

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (WeakRetained)
  {
    v7 = WeakRetained;
    v8 = objc_loadWeakRetained((id *)&self->_delegate);
    v9 = objc_opt_respondsToSelector();

    if ((v9 & 1) != 0)
    {
      v10 = objc_loadWeakRetained((id *)&self->_delegate);
      objc_msgSend(v10, "performSelector:withObject:", sel_eventViewControllerWillDisappear_, self);

    }
  }
  v11.receiver = self;
  v11.super_class = (Class)EKEventViewControllerDefaultImpl;
  -[EKEventViewControllerDefaultImpl viewWillDisappear:](&v11, sel_viewWillDisappear_, v3);
}

- (void)viewDidDisappear:(BOOL)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)EKEventViewControllerDefaultImpl;
  -[EKEventViewControllerDefaultImpl viewDidDisappear:](&v5, sel_viewDidDisappear_, a3);
  self->_didAppear = 0;
  objc_msgSend((id)EKWeakLinkClass(), "defaultContextManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeContextProvider:", self);

}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  id v5;

  -[EKEventViewControllerDefaultImpl tableView](self, "tableView", a4, a3.width, a3.height);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[EKEventViewControllerDefaultImpl updateTitleWithScrollView:animation:](self, "updateTitleWithScrollView:animation:", v5, 0);

}

- (void)didMoveToParentViewController:(id)a3
{
  id v4;
  objc_super v5;

  v4 = a3;
  v5.receiver = self;
  v5.super_class = (Class)EKEventViewControllerDefaultImpl;
  -[EKEventViewControllerDefaultImpl didMoveToParentViewController:](&v5, sel_didMoveToParentViewController_, v4);
  if (v4)
  {
    -[EKEventViewControllerDefaultImpl _updateNavBarAnimated:](self, "_updateNavBarAnimated:", 0);
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 && (objc_msgSend(v4, "isNavigationBarHidden") & 1) == 0)
      -[EKEventViewControllerDefaultImpl setMinimalMode:](self, "setMinimalMode:", 0);
  }

}

- (void)_updateTableContentInsetForKeyboard:(id)a3
{
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  void *v20;
  void *v21;
  UITableView *v22;
  double v23;
  CGFloat v24;
  double v25;
  CGFloat v26;
  double v27;
  CGFloat v28;
  double v29;
  CGFloat v30;
  double height;
  double v32;
  id v33;
  CGRect v34;
  CGRect v35;
  CGRect v36;

  v33 = a3;
  if (!-[UIViewController isPresentedInsidePopover](self, "isPresentedInsidePopover"))
  {
    -[UITableView contentInset](self->_tableView, "contentInset");
    v5 = v4;
    v7 = v6;
    v9 = v8;
    objc_msgSend(v33, "userInfo");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "objectForKey:", *MEMORY[0x1E0DC4E90]);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "CGRectValue");
    v13 = v12;
    v15 = v14;
    v17 = v16;
    v19 = v18;

    objc_msgSend(v33, "object");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "coordinateSpace");
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    v22 = self->_tableView;
    objc_msgSend(v21, "convertRect:toCoordinateSpace:", v22, v13, v15, v17, v19);
    v24 = v23;
    v26 = v25;
    v28 = v27;
    v30 = v29;
    -[UITableView bounds](self->_tableView, "bounds");
    v36.origin.x = v24;
    v36.origin.y = v26;
    v36.size.width = v28;
    v36.size.height = v30;
    v35 = CGRectIntersection(v34, v36);
    height = v35.size.height;
    if (CGRectIsEmpty(v35))
      v32 = 0.0;
    else
      v32 = height;
    -[UITableView setContentInset:](self->_tableView, "setContentInset:", v5, v7, v32, v9);

  }
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

  -[EKEventViewControllerDefaultImpl navigationItem](self, "navigationItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "leftBarButtonItem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!self->_showsDoneButton)
    goto LABEL_7;
  if ((objc_msgSend(v3, "hidesBackButton") & 1) == 0 && (!v4 || !objc_msgSend(v4, "systemItem")))
  {
    -[EKEventViewControllerDefaultImpl navigationController](self, "navigationController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "viewControllers");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v6, "count"))
    {
      -[EKEventViewControllerDefaultImpl _ekEventViewController](self, "_ekEventViewController");
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
  -[EKEventViewControllerDefaultImpl navigationItem](self, "navigationItem");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setBackButtonTitle:", v5);

  if (-[EKEventViewControllerDefaultImpl _shouldShowEditButton](self, "_shouldShowEditButton"))
  {
    v11 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0DC34F0]), "initWithBarButtonSystemItem:target:action:", 2, self, sel_editButtonTapped);
    if (-[EKEventViewControllerDefaultImpl _shouldDisplayDoneButton](self, "_shouldDisplayDoneButton"))
    {
      v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC34F0]), "initWithBarButtonSystemItem:target:action:", 0, self, sel__doneButtonTapped_);
      -[EKEventViewControllerDefaultImpl navigationItem](self, "navigationItem");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setLeftBarButtonItem:animated:", v11, v3);

      -[EKEventViewControllerDefaultImpl navigationItem](self, "navigationItem");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setRightBarButtonItem:animated:", v7, v3);

    }
    else
    {
      -[EKEventViewControllerDefaultImpl navigationItem](self, "navigationItem");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setRightBarButtonItem:animated:", v11, v3);
    }

  }
  else if (-[EKEventViewControllerDefaultImpl _shouldDisplayDoneButton](self, "_shouldDisplayDoneButton"))
  {
    v11 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0DC34F0]), "initWithBarButtonSystemItem:target:action:", 0, self, sel__doneButtonTapped_);
    -[EKEventViewControllerDefaultImpl navigationItem](self, "navigationItem");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setRightBarButtonItem:animated:", v11, v3);

  }
  else
  {
    -[EKEventViewControllerDefaultImpl navigationItem](self, "navigationItem");
    v11 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setRightBarButtonItem:animated:", 0, v3);
  }

}

- (BOOL)_shouldShowEditButton
{
  _BOOL4 v3;

  v3 = -[EKEventViewControllerDefaultImpl allowsEditing](self, "allowsEditing");
  if (v3)
    LOBYTE(v3) = -[EKEventViewControllerDefaultImpl _backingEventAllowsEditing](self, "_backingEventAllowsEditing");
  return v3;
}

- (CGSize)_idealSize
{
  void *v3;
  void *v4;
  double v5;
  void *v6;
  double v7;
  double v8;
  void *v9;
  double v10;
  double v11;
  void *v12;
  double v13;
  double v14;
  NSArray *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  double v19;
  uint64_t i;
  void *v21;
  unint64_t v22;
  double v23;
  double v24;
  double v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  uint64_t v31;
  CGSize result;

  v31 = *MEMORY[0x1E0C80C00];
  -[EKEventViewControllerDefaultImpl _reloadIfNeeded](self, "_reloadIfNeeded");
  -[EKEventViewControllerDefaultImpl _updateResponseVisibility](self, "_updateResponseVisibility");
  -[EKEventViewControllerDefaultImpl tableView](self, "tableView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "layoutIfNeeded");

  -[EKEventViewControllerDefaultImpl tableView](self, "tableView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bounds");
  if (v5 <= EKUIContainedControllerIdealWidth())
  {
    v8 = EKUIContainedControllerIdealWidth();
  }
  else
  {
    -[EKEventViewControllerDefaultImpl tableView](self, "tableView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "bounds");
    v8 = v7;

  }
  -[EKEventViewControllerDefaultImpl tableView](self, "tableView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "contentInset");
  v11 = v10;
  -[EKEventViewControllerDefaultImpl tableView](self, "tableView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "contentInset");
  v14 = v11 + v13;

  v28 = 0u;
  v29 = 0u;
  v26 = 0u;
  v27 = 0u;
  v15 = self->_currentSections;
  v16 = -[NSArray countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
  if (v16)
  {
    v17 = v16;
    v18 = *(_QWORD *)v27;
    v19 = *MEMORY[0x1E0DC53D8];
    do
    {
      for (i = 0; i != v17; ++i)
      {
        if (*(_QWORD *)v27 != v18)
          objc_enumerationMutation(v15);
        v21 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * i);
        if (objc_msgSend(v21, "numberOfRows", (_QWORD)v26))
        {
          v22 = 0;
          do
          {
            objc_msgSend(v21, "defaultCellHeightForSubitemAtIndex:forWidth:forceUpdate:", v22, 0, v8);
            if (v23 == v19)
              +[EKEventDetailCell detailsCellDefaultHeight](EKEventDetailCell, "detailsCellDefaultHeight");
            v14 = v14 + v23;
            ++v22;
          }
          while (v22 < objc_msgSend(v21, "numberOfRows"));
        }
      }
      v17 = -[NSArray countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
    }
    while (v17);
  }

  v24 = EKUIContainedControllerIdealWidth();
  v25 = v14;
  result.height = v25;
  result.width = v24;
  return result;
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
  -[EKEventViewControllerDefaultImpl _ekEventViewController](self, "_ekEventViewController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v8, "eventViewControllerShouldDismissSelf:", v9);

  return v10;
}

- (void)_pop
{
  NSObject *v3;
  id WeakRetained;
  id v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  unint64_t v11;
  void *v12;
  id v13;
  uint8_t v14[16];

  v3 = kEKUILogHandle;
  if (os_log_type_enabled((os_log_t)kEKUILogHandle, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v14 = 0;
    _os_log_impl(&dword_1AF84D000, v3, OS_LOG_TYPE_INFO, "EKEventViewController is dismissing itself; clients of this class should ideally handle their own dismissal by imp"
      "lementing the delegate method eventViewController:didCompleteWithAction:",
      v14,
      2u);
  }
  WeakRetained = objc_loadWeakRetained((id *)&self->_navigationDelegate);

  if (WeakRetained)
  {
    v5 = objc_loadWeakRetained((id *)&self->_navigationDelegate);
    objc_msgSend(v5, "popViewControllerAnimated:", 1);
  }
  else
  {
    if (!self->_didAppear)
    {
      self->_autoPop = 1;
      return;
    }
    -[EKEventViewControllerDefaultImpl navigationController](self, "navigationController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKEventViewControllerDefaultImpl _ekEventViewController](self, "_ekEventViewController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (id)objc_msgSend(v6, "popToViewController:animated:", v7, 0);

    -[EKEventViewControllerDefaultImpl navigationController](self, "navigationController");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "viewControllers");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "count");

    -[EKEventViewControllerDefaultImpl navigationController](self, "navigationController");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v12;
    if (v11 < 2)
      objc_msgSend(v12, "dismissViewControllerAnimated:completion:", 1, 0);
    else
      v13 = (id)objc_msgSend(v12, "popViewControllerAnimated:", 1);
  }

}

- (void)openAttendeesDetailItem
{
  dispatch_time_t v3;
  _QWORD block[5];

  v3 = dispatch_time(0, 100000000);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __59__EKEventViewControllerDefaultImpl_openAttendeesDetailItem__block_invoke;
  block[3] = &unk_1E6018688;
  block[4] = self;
  dispatch_after(v3, MEMORY[0x1E0C80D38], block);
}

void __59__EKEventViewControllerDefaultImpl_openAttendeesDetailItem__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;

  objc_msgSend(*(id *)(a1 + 32), "_indexPathForAttendeesDetailItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = 0;
  objc_msgSend(*(id *)(a1 + 32), "_itemAtIndexPath:section:subitemIndex:", v2, 0, &v5);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "_ekEventViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "eventViewController:didSelectSubitem:", v4, v5);

}

- (void)setNeedsReload
{
  -[EKEventViewControllerDefaultImpl _setNeedsReloadIncludingItems:](self, "_setNeedsReloadIncludingItems:", 0);
}

- (void)_setNeedsReloadIncludingItems:(BOOL)a3
{
  _BOOL4 v3;

  v3 = a3;
  if (-[EKEventViewControllerDefaultImpl isViewLoaded](self, "isViewLoaded"))
  {
    self->_needsReload = 1;
    if (v3)
      self->_itemsNeedReload = 1;
    objc_msgSend(MEMORY[0x1E0DE7910], "cancelPreviousPerformRequestsWithTarget:selector:object:", self, sel__reloadIfNeeded, 0);
    if (!self->_dead && !self->_tableIsBeingEdited)
      -[EKEventViewControllerDefaultImpl performSelector:withObject:afterDelay:](self, "performSelector:withObject:afterDelay:", sel__reloadIfNeeded, 0, 0.0);
  }
}

- (void)_reloadIfNeeded
{
  NSArray *v3;
  uint64_t v4;
  uint64_t v5;
  int v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  if (self->_needsReload
    && self->_viewIsVisible
    && -[EKEventViewControllerDefaultImpl isViewLoaded](self, "isViewLoaded"))
  {
    objc_msgSend(MEMORY[0x1E0DE7910], "cancelPreviousPerformRequestsWithTarget:selector:object:", self, sel__reloadIfNeeded, 0);
    v14 = 0u;
    v15 = 0u;
    v12 = 0u;
    v13 = 0u;
    v3 = self->_items;
    v4 = -[NSArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    if (v4)
    {
      v5 = v4;
      v6 = 0;
      v7 = *(_QWORD *)v13;
      do
      {
        for (i = 0; i != v5; ++i)
        {
          if (*(_QWORD *)v13 != v7)
            objc_enumerationMutation(v3);
          v9 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * i);
          objc_msgSend(v9, "reset", (_QWORD)v12);
          v6 |= objc_msgSend(v9, "detailItemVisibilityChanged");
        }
        v5 = -[NSArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      }
      while (v5);
    }
    else
    {
      LOBYTE(v6) = 0;
    }

    if (self->_itemsNeedReload || (v6 & 1) != 0)
    {
      if (self->_items)
      {
        -[EKEvent calendar](self->_event, "calendar");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        -[EKEventViewControllerDefaultImpl _configureItemsForStoreConstraintsGivenCalendar:](self, "_configureItemsForStoreConstraintsGivenCalendar:", v10);

      }
      else
      {
        -[EKEventViewControllerDefaultImpl _setUpForEvent](self, "_setUpForEvent");
      }
    }
    self->_itemsNeedReload = 0;
    self->_needsReload = 0;
    -[EKEventViewControllerDefaultImpl tableView](self, "tableView", (_QWORD)v12);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "reloadData");

    -[EKEventViewControllerDefaultImpl _updateStatusButtonsActions](self, "_updateStatusButtonsActions");
    -[EKEventViewControllerDefaultImpl preferredContentSize](self, "preferredContentSize");
    -[EKEventViewControllerDefaultImpl setPreferredContentSize:](self, "setPreferredContentSize:");
  }
}

- (void)setEvent:(id)a3
{
  EKEvent *v5;
  EKEvent **p_event;
  EKEvent *event;
  _QWORD *v8;
  void *v9;
  NSNumber *cachedShowNext;
  NSNumber *cachedShowPrevious;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  id v17;
  int v18;
  id v19;
  __int16 v20;
  EKEvent *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v5 = (EKEvent *)a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    p_event = &self->_event;
    event = self->_event;
    if (event != v5)
    {
      v8 = (_QWORD *)MEMORY[0x1E0CA9F70];
      if (event)
      {
        objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "removeObserver:name:object:", self, *v8, *p_event);

      }
      -[EKEventViewControllerDefaultImpl reloadReminderWithEKEvent:](self, "reloadReminderWithEKEvent:", v5);
      objc_storeStrong((id *)&self->_event, a3);
      cachedShowNext = self->_cachedShowNext;
      self->_cachedShowNext = 0;

      cachedShowPrevious = self->_cachedShowPrevious;
      self->_cachedShowPrevious = 0;

      -[EKEventViewControllerDefaultImpl _setUpForEvent](self, "_setUpForEvent");
      if (*p_event)
      {
        objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "addObserver:selector:name:object:", self, sel_setNeedsReload, *v8, *p_event);

      }
      if (-[EKEventViewControllerDefaultImpl isViewLoaded](self, "isViewLoaded"))
      {
        -[EKEventViewControllerDefaultImpl tableView](self, "tableView");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "reloadData");

        -[EKEventViewControllerDefaultImpl tableView](self, "tableView");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "selectRowAtIndexPath:animated:scrollPosition:", 0, 0, 0);

        -[EKEventViewControllerDefaultImpl _updateResponseVisibility](self, "_updateResponseVisibility");
        -[EKEventViewControllerDefaultImpl _updateResponse](self, "_updateResponse");
      }
      -[UIResponder EKUI_setDataOwnersFromEvent:](self, "EKUI_setDataOwnersFromEvent:", v5);
      -[EKEventViewControllerDefaultImpl _annotateEventEntityIfNeeded](self, "_annotateEventEntityIfNeeded");
    }
  }
  else
  {
    v15 = (void *)kEKUILogHandle;
    if (os_log_type_enabled((os_log_t)kEKUILogHandle, OS_LOG_TYPE_ERROR))
    {
      v16 = v15;
      v18 = 138412546;
      v19 = (id)objc_opt_class();
      v20 = 2112;
      v21 = v5;
      v17 = v19;
      _os_log_impl(&dword_1AF84D000, v16, OS_LOG_TYPE_ERROR, "Error: EKEventViewController setEvent given object of class %@. Description: %@", (uint8_t *)&v18, 0x16u);

    }
  }

}

- (void)reloadReminderWithEKEvent:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  REMStore *reminderStore;
  void *v11;
  objc_class *v12;
  REMStore *v13;
  REMStore *v14;
  uint64_t v15;
  id v16;
  REMReminder **p_reminder;
  REMReminder *v18;
  NSObject *v19;
  NSObject *v20;
  id v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t v25;
  _BYTE buf[24];
  void *v27;
  uint64_t *v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if ((objc_msgSend(v4, "isReminderIntegrationEvent") & 1) != 0)
  {
    objc_msgSend(v4, "uniqueID");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = 0;
    v23 = &v22;
    v24 = 0x2050000000;
    v7 = (void *)getREMObjectIDClass_softClass_0;
    v25 = getREMObjectIDClass_softClass_0;
    if (!getREMObjectIDClass_softClass_0)
    {
      *(_QWORD *)buf = MEMORY[0x1E0C809B0];
      *(_QWORD *)&buf[8] = 3221225472;
      *(_QWORD *)&buf[16] = __getREMObjectIDClass_block_invoke_0;
      v27 = &unk_1E6018EE8;
      v28 = &v22;
      __getREMObjectIDClass_block_invoke_0((uint64_t)buf);
      v7 = (void *)v23[3];
    }
    v8 = objc_retainAutorelease(v7);
    _Block_object_dispose(&v22, 8);
    objc_msgSend(v8, "objectIDWithURL:", v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      reminderStore = self->_reminderStore;
      if (!reminderStore)
      {
        v22 = 0;
        v23 = &v22;
        v24 = 0x2050000000;
        v11 = (void *)getREMStoreClass_softClass_0;
        v25 = getREMStoreClass_softClass_0;
        if (!getREMStoreClass_softClass_0)
        {
          *(_QWORD *)buf = MEMORY[0x1E0C809B0];
          *(_QWORD *)&buf[8] = 3221225472;
          *(_QWORD *)&buf[16] = __getREMStoreClass_block_invoke_0;
          v27 = &unk_1E6018EE8;
          v28 = &v22;
          __getREMStoreClass_block_invoke_0((uint64_t)buf);
          v11 = (void *)v23[3];
        }
        v12 = objc_retainAutorelease(v11);
        _Block_object_dispose(&v22, 8);
        v13 = (REMStore *)objc_alloc_init(v12);
        v14 = self->_reminderStore;
        self->_reminderStore = v13;

        reminderStore = self->_reminderStore;
      }
      v21 = 0;
      -[REMStore fetchReminderWithObjectID:error:](reminderStore, "fetchReminderWithObjectID:error:", v9, &v21);
      v15 = objc_claimAutoreleasedReturnValue();
      v16 = v21;
      p_reminder = &self->_reminder;
      v18 = *p_reminder;
      *p_reminder = (REMReminder *)v15;

      if (!*p_reminder || v16)
      {
        v19 = kEKUILogHandle;
        if (os_log_type_enabled((os_log_t)kEKUILogHandle, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412546;
          *(_QWORD *)&buf[4] = v6;
          *(_WORD *)&buf[12] = 2112;
          *(_QWORD *)&buf[14] = v16;
          _os_log_impl(&dword_1AF84D000, v19, OS_LOG_TYPE_ERROR, "Unable to fetch reminder (objectID: %@). Error: %@", buf, 0x16u);
        }
      }

    }
  }
  else
  {
    v20 = kEKUILogHandle;
    if (os_log_type_enabled((os_log_t)kEKUILogHandle, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      *(_QWORD *)&buf[4] = v4;
      _os_log_impl(&dword_1AF84D000, v20, OS_LOG_TYPE_ERROR, "Trying to reload reminder with EKEvent, but it's not a reminder. %@", buf, 0xCu);
    }
  }

}

- (EKEvent)event
{
  return self->_event;
}

- (void)_annotateEventEntityIfNeeded
{
  id v3;

  -[EKEventViewControllerDefaultImpl event](self, "event");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[UIViewController EKUI_annotateIfNeededWithAppEntityForEvent:isEditing:](self, "EKUI_annotateIfNeededWithAppEntityForEvent:isEditing:", v3, 0);

}

- (BOOL)_backingEventAllowsEditing
{
  void *v3;
  void *v4;
  int v5;

  if ((!-[EKEvent isReminderIntegrationEvent](self->_event, "isReminderIntegrationEvent")
     || -[EKEvent CUIK_reminderShouldBeEditable](self->_event, "CUIK_reminderShouldBeEditable"))
    && -[EKEvent isEditable](self->_event, "isEditable"))
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

- (void)setAllowsEditing:(BOOL)a3
{
  void *v4;
  NSUInteger v5;
  void *v6;

  if (self->_allowsEditing != a3)
  {
    self->_allowsEditing = a3;
    -[EKEventViewControllerDefaultImpl setAllowsInviteResponses:](self, "setAllowsInviteResponses:");
    if (-[EKEventViewControllerDefaultImpl isViewLoaded](self, "isViewLoaded")
      && -[EKEventViewControllerDefaultImpl viewIsVisible](self, "viewIsVisible"))
    {
      -[EKEventViewControllerDefaultImpl _updateNavBarAnimated:](self, "_updateNavBarAnimated:", 1);
    }
    -[EKEvent calendar](self->_event, "calendar");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (v4)
    {
      v5 = -[NSArray count](self->_currentSections, "count");
      -[EKEvent calendar](self->_event, "calendar");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[EKEventViewControllerDefaultImpl _configureItemsForStoreConstraintsGivenCalendar:](self, "_configureItemsForStoreConstraintsGivenCalendar:", v6);

      if (v5 != -[NSArray count](self->_currentSections, "count"))
        -[EKEventViewControllerDefaultImpl setNeedsReload](self, "setNeedsReload");
    }
  }
}

- (void)setAllowsInviteResponses:(BOOL)a3
{
  if (self->_allowsInviteResponses != a3)
  {
    self->_allowsInviteResponses = a3;
    -[EKEventViewControllerDefaultImpl setNeedsReload](self, "setNeedsReload");
  }
}

- (BOOL)allowsCalendarPreview
{
  void *v2;
  int v3;

  if (self->_showsPreview)
  {
    -[EKEventViewControllerDefaultImpl event](self, "event");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = objc_msgSend(v2, "isAllDay") ^ 1;

  }
  else
  {
    LOBYTE(v3) = 0;
  }
  return v3;
}

- (void)setAllowsCalendarPreview:(BOOL)a3
{
  if (!self->_hidePreview && self->_showsPreview != a3)
  {
    self->_showsPreview = a3;
    -[EKEventViewControllerDefaultImpl _setNeedsReloadIncludingItems:](self, "_setNeedsReloadIncludingItems:", 1);
  }
}

- (BOOL)hideCalendarPreview
{
  return self->_hidePreview;
}

- (void)setHideCalendarPreview:(BOOL)a3
{
  if (self->_hidePreview != a3)
  {
    self->_hidePreview = a3;
    if (a3)
      self->_showsPreview = 0;
    -[EKEventViewControllerDefaultImpl _setNeedsReloadIncludingItems:](self, "_setNeedsReloadIncludingItems:", 1);
  }
}

- (BOOL)calendarPreviewIsInlineDayView
{
  return self->_calendarPreviewIsInlineDayView;
}

- (void)setCalendarPreviewIsInlineDayView:(BOOL)a3
{
  if (self->_calendarPreviewIsInlineDayView != a3)
  {
    self->_calendarPreviewIsInlineDayView = a3;
    -[EKEventViewControllerDefaultImpl _setNeedsReloadIncludingItems:](self, "_setNeedsReloadIncludingItems:", 1);
  }
}

- (BOOL)inlineDayViewRespectsSelectedCalendarsFilter
{
  return self->_inlineDayViewRespectsSelectedCalendarsFilter;
}

- (void)setInlineDayViewRespectsSelectedCalendarsFilter:(BOOL)a3
{
  if (self->_inlineDayViewRespectsSelectedCalendarsFilter != a3)
  {
    self->_inlineDayViewRespectsSelectedCalendarsFilter = a3;
    -[EKEventViewControllerDefaultImpl setNeedsReload](self, "setNeedsReload");
  }
}

- (void)setICSPreview:(BOOL)a3
{
  if (self->_ICSPreview != a3)
  {
    self->_ICSPreview = a3;
    self->_scrollToSection = 1;
    -[EKEventViewControllerDefaultImpl setNeedsReload](self, "setNeedsReload");
  }
}

- (void)setShowsAddToCalendarForICSPreview:(BOOL)a3
{
  if (self->_showsAddToCalendarForICSPreview != a3)
  {
    self->_showsAddToCalendarForICSPreview = a3;
    -[EKEventViewControllerDefaultImpl setNeedsReload](self, "setNeedsReload");
  }
}

- (void)setShowsUpdateCalendarForICSPreview:(BOOL)a3
{
  if (self->_showsUpdateCalendarForICSPreview != a3)
  {
    self->_showsUpdateCalendarForICSPreview = a3;
    -[EKEventViewControllerDefaultImpl setNeedsReload](self, "setNeedsReload");
  }
}

- (void)setShowsDeleteForICSPreview:(BOOL)a3
{
  if (self->_showsDeleteForICSPreview != a3)
  {
    self->_showsDeleteForICSPreview = a3;
    -[EKEventViewControllerDefaultImpl setNeedsReload](self, "setNeedsReload");
  }
}

- (void)setShowsDoneButton:(BOOL)a3
{
  if (self->_showsDoneButton != a3)
  {
    self->_showsDoneButton = a3;
    -[EKEventViewControllerDefaultImpl setNeedsReload](self, "setNeedsReload");
  }
}

- (void)setShowsOutOfDateMessage:(BOOL)a3
{
  if (self->_showsOutOfDateMessage != a3)
  {
    self->_showsOutOfDateMessage = a3;
    -[EKEventViewControllerDefaultImpl setNeedsReload](self, "setNeedsReload");
    -[EKEventViewControllerDefaultImpl _updateStatusButtonsActions](self, "_updateStatusButtonsActions");
  }
}

- (void)setShowsDelegatorMessage:(BOOL)a3
{
  if (self->_showsDelegatorMessage != a3)
  {
    self->_showsDelegatorMessage = a3;
    -[EKEventViewControllerDefaultImpl setNeedsReload](self, "setNeedsReload");
    -[EKEventViewControllerDefaultImpl _updateStatusButtonsActions](self, "_updateStatusButtonsActions");
  }
}

- (void)setShowsDelegateMessage:(BOOL)a3
{
  if (self->_showsDelegateMessage != a3)
  {
    self->_showsDelegateMessage = a3;
    -[EKEventViewControllerDefaultImpl setNeedsReload](self, "setNeedsReload");
    -[EKEventViewControllerDefaultImpl _updateStatusButtonsActions](self, "_updateStatusButtonsActions");
  }
}

- (BOOL)minimalMode
{
  return self->_minimalMode || self->_noninteractivePlatterMode;
}

- (void)setMinimalMode:(BOOL)a3
{
  if (self->_minimalMode != a3)
  {
    self->_minimalMode = a3;
    -[EKEventViewControllerDefaultImpl _setNeedsReloadIncludingItems](self, "_setNeedsReloadIncludingItems");
  }
}

- (void)setNoninteractivePlatterMode:(BOOL)a3
{
  if (self->_noninteractivePlatterMode != a3)
  {
    self->_noninteractivePlatterMode = a3;
    -[EKEventViewControllerDefaultImpl _setNeedsReloadIncludingItems](self, "_setNeedsReloadIncludingItems");
  }
}

- (void)_setNeedsReloadIncludingItems
{
  NSArray *items;

  items = self->_items;
  self->_items = 0;

  -[UITableView setSeparatorStyle:](self->_tableView, "setSeparatorStyle:", !self->_minimalMode);
  -[EKEventViewControllerDefaultImpl _setNeedsReloadIncludingItems:](self, "_setNeedsReloadIncludingItems:", 1);
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
    self->_ignoreDBChanges = 1;
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
  -[EKEventViewControllerDefaultImpl _dismissEditor:deleted:](self, "_dismissEditor:deleted:", 0, a3 == 2);
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (WeakRetained)
  {
    v9 = WeakRetained;
    v10 = objc_loadWeakRetained((id *)&self->_delegate);
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      v11 = -[EKEventViewControllerDefaultImpl _shouldPopSelf](self, "_shouldPopSelf");

      if (!v11)
      {
        v13 = objc_loadWeakRetained((id *)&self->_delegate);
        -[EKEventViewControllerDefaultImpl _ekEventViewController](self, "_ekEventViewController");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "eventViewController:didCompleteWithAction:", v12, a3);

        return;
      }
    }
    else
    {

    }
  }
  -[EKEventViewControllerDefaultImpl _pop](self, "_pop");
}

- (id)accessDeniedView
{
  _UIAccessDeniedView *accessDeniedView;
  id v4;
  void *v5;
  _UIAccessDeniedView *v6;
  _UIAccessDeniedView *v7;
  void *v8;
  void *v9;

  accessDeniedView = self->_accessDeniedView;
  if (!accessDeniedView)
  {
    v4 = objc_alloc(MEMORY[0x1E0DC3FE0]);
    -[EKEventViewControllerDefaultImpl view](self, "view");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "bounds");
    v6 = (_UIAccessDeniedView *)objc_msgSend(v4, "initWithFrame:");
    v7 = self->_accessDeniedView;
    self->_accessDeniedView = v6;

    -[_UIAccessDeniedView setAutoresizingMask:](self->_accessDeniedView, "setAutoresizingMask:", 18);
    EventKitUIBundle();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("This app does not have access to your calendars."), &stru_1E601DFA8, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIAccessDeniedView setTitle:](self->_accessDeniedView, "setTitle:", v9);

    accessDeniedView = self->_accessDeniedView;
  }
  return accessDeniedView;
}

- (void)setShouldOverrideAuthorizationStatus:(BOOL)a3 withRemoteUIStatus:(int64_t)a4
{
  self->_shouldOverrideAuthorizationStatus = a3;
  -[EKEventViewControllerDefaultImpl _updateAccessDeniedViewWithNewStatus:](self, "_updateAccessDeniedViewWithNewStatus:", a4);
}

- (void)setTopInset:(double)a3
{
  -[UITableView contentInset](self->_tableView, "contentInset");
  -[UITableView setContentInset:](self->_tableView, "setContentInset:", a3);
}

- (UIScrollView)eventDetailsScrollView
{
  return (UIScrollView *)self->_tableView;
}

- (void)setDelegate:(id)a3
{
  id WeakRetained;
  void *v5;
  id obj;

  obj = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  v5 = obj;
  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_delegate, obj);
    v5 = obj;
    if (obj)
    {
      -[EKEventViewControllerDefaultImpl setNeedsReload](self, "setNeedsReload");
      v5 = obj;
    }
  }

}

- (void)_setObservesKeyboardNotifications:(BOOL)a3
{
  _BOOL4 v3;
  id v5;

  v3 = a3;
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    objc_msgSend(v5, "addObserver:selector:name:object:", self, sel__updateTableContentInsetForKeyboard_, *MEMORY[0x1E0DC4FE8], 0);
    objc_msgSend(v5, "addObserver:selector:name:object:", self, sel__updateTableContentInsetForKeyboard_, *MEMORY[0x1E0DC4FE0], 0);
    objc_msgSend(v5, "addObserver:selector:name:object:", self, sel__keyboardWasShown_, *MEMORY[0x1E0DC4E70], 0);
    objc_msgSend(v5, "addObserver:selector:name:object:", self, sel__keyboardWasHidden_, *MEMORY[0x1E0DC4E68], 0);
  }
  else
  {
    objc_msgSend(v5, "removeObserver:name:object:", self, *MEMORY[0x1E0DC4FE8], 0);
    objc_msgSend(v5, "removeObserver:name:object:", self, *MEMORY[0x1E0DC4FE0], 0);
    objc_msgSend(v5, "removeObserver:name:object:", self, *MEMORY[0x1E0DC4E70], 0);
    objc_msgSend(v5, "removeObserver:name:object:", self, *MEMORY[0x1E0DC4E68], 0);
  }

}

- (BOOL)_refreshEventAndReload
{
  int v3;
  NSNumber *cachedShowNext;
  NSNumber *cachedShowPrevious;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v3 = -[EKEvent refreshIfRefreshableAndNotify:](self->_event, "refreshIfRefreshableAndNotify:", 1);
  if (v3)
  {
    if (-[EKEvent isReminderIntegrationEvent](self->_event, "isReminderIntegrationEvent"))
    {
      -[EKEventViewControllerDefaultImpl reloadReminderWithEKEvent:](self, "reloadReminderWithEKEvent:", self->_event);
      -[EKEventViewControllerDefaultImpl _setUpForEvent](self, "_setUpForEvent");
    }
    cachedShowNext = self->_cachedShowNext;
    self->_cachedShowNext = 0;

    cachedShowPrevious = self->_cachedShowPrevious;
    self->_cachedShowPrevious = 0;

    v14 = 0u;
    v15 = 0u;
    v12 = 0u;
    v13 = 0u;
    -[EKEventViewControllerDefaultImpl items](self, "items", 0);
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
          objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * v10++), "refreshCopiedEvents");
        }
        while (v8 != v10);
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      }
      while (v8);
    }

    -[EKEventViewControllerDefaultImpl setNeedsReload](self, "setNeedsReload");
  }
  return v3;
}

- (void)_storeChanged:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  int v7;
  uint64_t v8;
  id v9;

  v9 = a3;
  if (!-[EKEventViewControllerDefaultImpl eventEditViewPresented](self, "eventEditViewPresented")
    && !self->_ignoreDBChanges
    && (-[EKEvent isNew](self->_event, "isNew") & 1) == 0)
  {
    objc_msgSend(v9, "userInfo");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKey:", *MEMORY[0x1E0CA9F90]);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v5
      || (-[EKEvent objectID](self->_event, "objectID"),
          v6 = (void *)objc_claimAutoreleasedReturnValue(),
          v7 = objc_msgSend(v5, "containsObject:", v6),
          v6,
          v7))
    {
      if (-[EKEventViewControllerDefaultImpl _refreshEventAndReload](self, "_refreshEventAndReload"))
        -[UIResponder EKUI_setDataOwnersFromEvent:](self, "EKUI_setDataOwnersFromEvent:", self->_event);
      else
        -[EKEventViewControllerDefaultImpl completeWithAction:](self, "completeWithAction:", 2);
    }

  }
  if (-[EKEventViewControllerDefaultImpl isViewLoaded](self, "isViewLoaded"))
  {
    if (!self->_shouldOverrideAuthorizationStatus)
    {
      v8 = objc_msgSend(MEMORY[0x1E0CAA078], "realAuthorizationStatusForEntityType:", 0);
      if (v8 != self->_lastAuthorizationStatus)
        -[EKEventViewControllerDefaultImpl _updateAccessDeniedViewWithNewStatus:](self, "_updateAccessDeniedViewWithNewStatus:", v8);
    }
  }

}

- (void)_updateAccessDeniedViewWithNewStatus:(int64_t)a3
{
  _UIAccessDeniedView *accessDeniedView;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  if (self->_lastAuthorizationStatus != a3)
  {
    accessDeniedView = self->_accessDeniedView;
    if (a3 < 3)
    {
      if (accessDeniedView)
        goto LABEL_9;
      -[EKEventViewControllerDefaultImpl firstResponder](self, "firstResponder");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "resignFirstResponder");

      -[EKEventViewControllerDefaultImpl view](self, "view");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[EKEventViewControllerDefaultImpl accessDeniedView](self, "accessDeniedView");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "addSubview:", v9);

      -[EKEventViewControllerDefaultImpl view](self, "view");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[EKEventViewControllerDefaultImpl accessDeniedView](self, "accessDeniedView");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "bringSubviewToFront:", v11);

      if (a3 != 1)
        goto LABEL_9;
      -[EKEventViewControllerDefaultImpl accessDeniedView](self, "accessDeniedView");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setMessage:", CFSTR(" "));
    }
    else
    {
      if (!accessDeniedView)
      {
LABEL_9:
        self->_lastAuthorizationStatus = a3;
        return;
      }
      -[_UIAccessDeniedView removeFromSuperview](accessDeniedView, "removeFromSuperview");
      v6 = self->_accessDeniedView;
      self->_accessDeniedView = 0;
    }

    goto LABEL_9;
  }
}

- (void)_localeChanged
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  -[EKEventViewControllerDefaultImpl items](self, "items", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v10;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v10 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * v7++), "reset");
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v5);
  }

  -[EKEventViewControllerDefaultImpl tableView](self, "tableView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "reloadData");

}

- (void)_keyboardWasShown:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  int v7;
  id v8;

  -[EKEventViewControllerDefaultImpl view](self, "view", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "window");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "firstResponder");
  v8 = (id)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[EKEventViewControllerDefaultImpl tableView](self, "tableView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v8, "isDescendantOfView:", v6);

    if (v7)
      self->_tableIsBeingEdited = 1;
  }

}

- (void)_keyboardWasHidden:(id)a3
{
  self->_tableIsBeingEdited = 0;
  -[EKEventViewControllerDefaultImpl setNeedsReload](self, "setNeedsReload", a3);
}

- (BOOL)_reminderMode
{
  return -[EKEvent isReminderIntegrationEvent](self->_event, "isReminderIntegrationEvent");
}

- (id)items
{
  NSArray *items;
  EKEventTitleDetailItem *v4;
  EKEventTitleDetailItem *titleItem;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  EKEventOrganizerDetailItem *v11;
  EKEventAttendeesDetailItem *v12;
  EKEventAttendeeCommentsDetailItem *v13;
  EKReminderTitleDetailItem *v14;
  EKReminderDateDetailItem *v15;
  EKReminderListDetailItem *v16;
  EKReminderURLDetailItem *v17;
  EKReminderUneditableButtonDetailItem *v18;
  EKEventViewControllerDefaultImpl *v19;
  EKReminderUneditableButtonDetailItem *v20;
  EKReminderURLDetailItem *v21;
  EKReminderNotesDetailItem *v22;
  EKEventPreviewDetailItem *v23;
  void *v24;
  _QWORD *v25;
  uint64_t v26;
  _BOOL4 v27;
  _BOOL4 v28;
  void *v29;
  _QWORD *v30;
  uint64_t v31;
  NSArray *v32;
  EKEventAttendeesDetailItem *v33;
  NSArray *v34;
  EKReminderURLDetailItem *v36;
  EKReminderNotesDetailItem *v37;
  void *v38;
  EKEventPreviewDetailItem *v39;
  EKEventAttendeeCommentsDetailItem *v40;
  EKEventAttendeesDetailItem *v41;
  void *v42;
  EKShowInRemindersDetailItem *v43;
  EKEventOrganizerDetailItem *v44;
  EKEventImportedNoticeDetailItem *v45;
  EKEventPrivacyLevelDetailItem *v46;
  EKEventConferenceInformationDetailItem *v47;
  EKEventNotesDetailItem *v48;
  EKEventEditedByDetailItem *v49;
  EKEventURLDetailItem *v50;
  EKEventShowInCalendarDetailItem *v51;
  EKEventAttachmentDetailItem *v52;
  EKEventProposedTimeDetailItem *v53;
  EKEventProposeNewTimeItem *v54;
  EKEventCommentDetailItem *v55;
  EKEventTravelDetailItem *v56;
  EKEventAvailabilityDetailItem *v57;
  EKEventAlarmDetailItem *v58;
  EKEventMapDetailItem *v59;
  EKEventCalendarDetailItem *v60;
  _QWORD v61[21];
  _QWORD v62[8];
  _QWORD v63[2];
  _QWORD v64[3];
  _QWORD v65[4];
  _QWORD v66[9];

  v66[7] = *MEMORY[0x1E0C80C00];
  items = self->_items;
  if (!items)
  {
    v4 = objc_alloc_init(EKEventTitleDetailItem);
    titleItem = self->_titleItem;
    self->_titleItem = v4;

    -[EKEventTitleDetailItem setEditDelegate:](self->_titleItem, "setEditDelegate:", self);
    -[EKEventViewControllerDefaultImpl context](self, "context");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("EKUIEventDetailsFromTravelAdvisoryContext"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v42 = v7;
    v8 = objc_msgSend(v7, "BOOLValue");
    -[EKEventTitleDetailItem setHasMapItemLaunchOptionFromTimeToLeaveNotification:](self->_titleItem, "setHasMapItemLaunchOptionFromTimeToLeaveNotification:", v8);
    if (-[EKEventViewControllerDefaultImpl noninteractivePlatterMode](self, "noninteractivePlatterMode"))
      v9 = 3;
    else
      v9 = 0;
    -[EKEventTitleDetailItem setNumberOfTitleLines:](self->_titleItem, "setNumberOfTitleLines:", v9);
    v59 = objc_alloc_init(EKEventMapDetailItem);
    -[EKEventMapDetailItem setHasMapItemLaunchOptionFromTimeToLeaveNotification:](v59, "setHasMapItemLaunchOptionFromTimeToLeaveNotification:", v8);
    v60 = objc_alloc_init(EKEventCalendarDetailItem);
    v58 = objc_alloc_init(EKEventAlarmDetailItem);
    -[EKEventDetailItem setViewControllerToPresentFrom:](v58, "setViewControllerToPresentFrom:", self);
    v57 = objc_alloc_init(EKEventAvailabilityDetailItem);
    v56 = objc_alloc_init(EKEventTravelDetailItem);
    v55 = objc_alloc_init(EKEventCommentDetailItem);
    -[EKEventViewControllerDefaultImpl optionalModel](self, "optionalModel");
    v10 = objc_claimAutoreleasedReturnValue();
    v54 = -[EKEventProposeNewTimeItem initWithModel:]([EKEventProposeNewTimeItem alloc], "initWithModel:", v10);
    v53 = objc_alloc_init(EKEventProposedTimeDetailItem);
    v11 = objc_alloc_init(EKEventOrganizerDetailItem);
    v12 = objc_alloc_init(EKEventAttendeesDetailItem);
    -[EKEventDetailItem setViewControllerToPresentFrom:](v12, "setViewControllerToPresentFrom:", self);
    v13 = objc_alloc_init(EKEventAttendeeCommentsDetailItem);
    -[EKEventDetailItem setViewControllerToPresentFrom:](v13, "setViewControllerToPresentFrom:", self);
    v52 = objc_alloc_init(EKEventAttachmentDetailItem);
    v39 = -[EKEventPreviewDetailItem initWithModel:]([EKEventPreviewDetailItem alloc], "initWithModel:", v10);
    v38 = (void *)v10;
    v51 = -[EKEventShowInCalendarDetailItem initWithModel:]([EKEventShowInCalendarDetailItem alloc], "initWithModel:", v10);
    v50 = objc_alloc_init(EKEventURLDetailItem);
    v49 = objc_alloc_init(EKEventEditedByDetailItem);
    v48 = objc_alloc_init(EKEventNotesDetailItem);
    -[EKEventDetailItem setViewControllerToPresentFrom:](v48, "setViewControllerToPresentFrom:", self);
    v47 = objc_alloc_init(EKEventConferenceInformationDetailItem);
    -[EKEventDetailItem setViewControllerToPresentFrom:](v47, "setViewControllerToPresentFrom:", self);
    v46 = objc_alloc_init(EKEventPrivacyLevelDetailItem);
    v45 = objc_alloc_init(EKEventImportedNoticeDetailItem);
    v14 = objc_alloc_init(EKReminderTitleDetailItem);
    -[EKReminderTitleDetailItem setEditDelegate:](v14, "setEditDelegate:", self);
    v15 = objc_alloc_init(EKReminderDateDetailItem);
    v16 = objc_alloc_init(EKReminderListDetailItem);
    v37 = objc_alloc_init(EKReminderNotesDetailItem);
    v17 = objc_alloc_init(EKReminderURLDetailItem);
    v43 = objc_alloc_init(EKShowInRemindersDetailItem);
    v18 = [EKReminderUneditableButtonDetailItem alloc];
    if (-[EKEventViewControllerDefaultImpl noninteractivePlatterMode](self, "noninteractivePlatterMode"))
      v19 = 0;
    else
      v19 = self;
    v20 = -[EKReminderUneditableButtonDetailItem initWithUneditableButtonDetailItemDelegate:](v18, "initWithUneditableButtonDetailItemDelegate:", v19);
    v40 = v13;
    v41 = v12;
    v44 = v11;
    if (-[EKEventViewControllerDefaultImpl noninteractivePlatterMode](self, "noninteractivePlatterMode"))
    {
      if (-[EKEventViewControllerDefaultImpl _reminderMode](self, "_reminderMode"))
      {
        v66[0] = v14;
        v66[1] = v20;
        v66[2] = v16;
        v66[3] = v17;
        v21 = v17;
        v22 = v37;
        v23 = v39;
        v66[4] = v37;
        v66[5] = v39;
        v66[6] = v15;
        v24 = (void *)MEMORY[0x1E0C99D20];
        v25 = v66;
        v26 = 7;
LABEL_17:
        objc_msgSend(v24, "arrayWithObjects:count:", v25, v26);
        v32 = (NSArray *)objc_claimAutoreleasedReturnValue();
        v33 = v41;
LABEL_22:
        v34 = self->_items;
        self->_items = v32;

        items = self->_items;
        return items;
      }
      -[EKEventOrganizerDetailItem setHideDisclosureIndicator:](v11, "setHideDisclosureIndicator:", 1);
      v23 = v39;
      v65[0] = self->_titleItem;
      v65[1] = v39;
      v65[2] = v60;
      v65[3] = v11;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v65, 4);
      v32 = (NSArray *)objc_claimAutoreleasedReturnValue();
      v33 = v41;
    }
    else
    {
      v27 = -[EKEventViewControllerDefaultImpl minimalMode](self, "minimalMode");
      v28 = -[EKEventViewControllerDefaultImpl _reminderMode](self, "_reminderMode");
      if (v27)
      {
        v36 = v17;
        if (v28)
        {
          v64[0] = v14;
          v64[1] = v20;
          v64[2] = v15;
          v29 = (void *)MEMORY[0x1E0C99D20];
          v30 = v64;
          v31 = 3;
        }
        else
        {
          v63[0] = self->_titleItem;
          v63[1] = v60;
          v29 = (void *)MEMORY[0x1E0C99D20];
          v30 = v63;
          v31 = 2;
        }
        objc_msgSend(v29, "arrayWithObjects:count:", v30, v31);
        v32 = (NSArray *)objc_claimAutoreleasedReturnValue();
        v33 = v12;
        v23 = v39;
        v22 = v37;
        v21 = v36;
        goto LABEL_22;
      }
      v23 = v39;
      if (v28)
      {
        v62[0] = v14;
        v62[1] = v20;
        v62[2] = v16;
        v62[3] = v17;
        v21 = v17;
        v22 = v37;
        v62[4] = v37;
        v62[5] = v43;
        v62[6] = v39;
        v62[7] = v15;
        v24 = (void *)MEMORY[0x1E0C99D20];
        v25 = v62;
        v26 = 8;
        goto LABEL_17;
      }
      v61[0] = self->_titleItem;
      v61[1] = v53;
      v61[2] = v54;
      v61[3] = v39;
      v61[4] = v60;
      v61[5] = v44;
      v33 = v41;
      v61[6] = v41;
      v61[7] = v13;
      v61[8] = v56;
      v61[9] = v58;
      v61[10] = v57;
      v61[11] = v46;
      v61[12] = v52;
      v61[13] = v50;
      v61[14] = v49;
      v61[15] = v47;
      v61[16] = v48;
      v61[17] = v51;
      v61[18] = v55;
      v61[19] = v59;
      v61[20] = v45;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v61, 21);
      v32 = (NSArray *)objc_claimAutoreleasedReturnValue();
    }
    v21 = v17;
    v22 = v37;
    goto LABEL_22;
  }
  return items;
}

- (id)optionalModel
{
  return -[NSDictionary objectForKeyedSubscript:](self->_context, "objectForKeyedSubscript:", CFSTR("EKUIEventDetailsContext_ModelKey"));
}

- (void)_configureItemsForStoreConstraintsGivenCalendar:(id)a3
{
  void *v4;
  id v5;
  id v6;
  void *v7;
  EKEventDetailGroup *v8;
  void *v9;
  EKEventDetailGroup *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  __objc2_class **p_superclass;
  int *v16;
  EKEventTitleDetailItem *v17;
  int *v18;
  __objc2_class **v19;
  void *v20;
  EKEventTitleDetailItem *v21;
  EKEventTitleDetailItem *titleItem;
  void *v23;
  EKEventTitleDetailItem *v24;
  uint64_t v25;
  void *v26;
  EKEventTitleDetailItem *v27;
  EKEventTitleDetailItem *v28;
  BOOL v29;
  EKEventTitleDetailItem *v30;
  EKEvent *event;
  uint64_t v32;
  EKEvent *v33;
  void *v34;
  char isKindOfClass;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  void *v39;
  char v40;
  void *v41;
  uint64_t v42;
  void *v43;
  void *v44;
  uint64_t v45;
  NSArray *currentSections;
  int v47;
  void *v48;
  REMReminder *reminder;
  void *v50;
  EKEventDetailGroup *v51;
  void *v52;
  id v53;
  id v54;
  id v55;
  id v56;
  EKEventDetailGroup *v57;
  EKEventDetailGroup *v58;
  EKEventDetailGroup *v59;
  EKEventDetailGroup *v60;
  EKEventDetailGroup *v61;
  EKEventDetailGroup *v62;
  EKEventDetailGroup *v63;
  EKEventDetailGroup *v64;
  EKEventEditableDetailGroup *v65;
  EKEventDetailGroup *v66;
  id v67;
  id v68;
  id v69;
  id v70;
  id v71;
  NSArray *v72;
  id v73;

  v73 = a3;
  if (self->_items)
  {
    -[EKEventViewControllerDefaultImpl items](self, "items");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v72 = (NSArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v71 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v68 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v55 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v70 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v54 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v53 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v6 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v67 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v69 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v56 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    EventKitUIBundle();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v66 = -[EKEventDetailGroup initWithTag:headerTitle:]([EKEventDetailGroup alloc], "initWithTag:headerTitle:", 0, 0);
    v65 = -[EKEventDetailGroup initWithTag:headerTitle:]([EKEventEditableDetailGroup alloc], "initWithTag:headerTitle:", 1, 0);
    v64 = -[EKEventDetailGroup initWithTag:headerTitle:]([EKEventDetailGroup alloc], "initWithTag:headerTitle:", 3, 0);
    v8 = [EKEventDetailGroup alloc];
    objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("Attachments"), &stru_1E601DFA8, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v63 = -[EKEventDetailGroup initWithTag:headerTitle:](v8, "initWithTag:headerTitle:", 8, v9);

    v62 = -[EKEventDetailGroup initWithTag:headerTitle:]([EKEventDetailGroup alloc], "initWithTag:headerTitle:", 9, 0);
    v61 = -[EKEventDetailGroup initWithTag:headerTitle:]([EKEventDetailGroup alloc], "initWithTag:headerTitle:", 10, 0);
    v10 = [EKEventDetailGroup alloc];
    v52 = v7;
    v11 = v7;
    v12 = v6;
    objc_msgSend(v11, "localizedStringForKey:value:table:", CFSTR("Notes"), &stru_1E601DFA8, 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v60 = -[EKEventDetailGroup initWithTag:headerTitle:](v10, "initWithTag:headerTitle:", 11, v13);

    v59 = -[EKEventDetailGroup initWithTag:headerTitle:]([EKEventDetailGroup alloc], "initWithTag:headerTitle:", 12, 0);
    v58 = -[EKEventDetailGroup initWithTag:headerTitle:]([EKEventDetailGroup alloc], "initWithTag:headerTitle:", 13, 0);
    v57 = -[EKEventDetailGroup initWithTag:headerTitle:]([EKEventDetailGroup alloc], "initWithTag:headerTitle:", 14, 0);
    v51 = -[EKEventDetailGroup initWithTag:headerTitle:]([EKEventDetailGroup alloc], "initWithTag:headerTitle:", 15, 0);
    -[EKEventTitleDetailItem setHidesTopSeparator:](self->_titleItem, "setHidesTopSeparator:", 1);
    -[EKEventTitleDetailItem setHidesBottomSeparator:](self->_titleItem, "setHidesBottomSeparator:", 0);
    if (objc_msgSend(v4, "count"))
    {
      v14 = 0;
      p_superclass = &OBJC_METACLASS___EKEventAttendeeDetailGroup.superclass;
      v16 = &OBJC_IVAR___EKUIInviteesViewNotRespondedInviteesSection__cachedInviteeCellReuseIdentifier;
      v50 = v4;
      while (1)
      {
        objc_msgSend(v4, "objectAtIndexedSubscript:", v14);
        v17 = (EKEventTitleDetailItem *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          if (-[EKEventViewControllerDefaultImpl allowsCalendarPreview](self, "allowsCalendarPreview")
            && -[EKEventViewControllerDefaultImpl calendarPreviewIsInlineDayView](self, "calendarPreviewIsInlineDayView")&& -[EKEventTitleDetailItem configureWithCalendar:preview:](v17, "configureWithCalendar:preview:", v73, *((unsigned __int8 *)&self->super.super.super.isa + v16[490])))
          {
            v18 = v16;
            v19 = p_superclass;
            v20 = v12;
            objc_msgSend(v5, "lastObject");
            v21 = (EKEventTitleDetailItem *)objc_claimAutoreleasedReturnValue();
            titleItem = self->_titleItem;

            objc_msgSend(v5, "addObject:", v17);
            -[EKEventTitleDetailItem setCellPosition:](v17, "setCellPosition:", 2);
            -[EKEventTitleDetailItem setInlineDayViewRespectsSelectedCalendarsFilter:](v17, "setInlineDayViewRespectsSelectedCalendarsFilter:", -[EKEventViewControllerDefaultImpl inlineDayViewRespectsSelectedCalendarsFilter](self, "inlineDayViewRespectsSelectedCalendarsFilter"));
            if (v21 == titleItem)
              -[EKEventTitleDetailItem setHidesBottomSeparator:](self->_titleItem, "setHidesBottomSeparator:", 1);
            -[EKEventTitleDetailItem setHideBottomSeparator:](v17, "setHideBottomSeparator:", -[EKEventViewControllerDefaultImpl _reminderMode](self, "_reminderMode"));
            v12 = v20;
            v4 = v50;
            p_superclass = v19;
            v16 = v18;
          }
          goto LABEL_25;
        }
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          break;
        if (-[EKEventTitleDetailItem configureWithCalendar:preview:](v17, "configureWithCalendar:preview:", v73, *((unsigned __int8 *)&self->super.super.super.isa + v16[490])))
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            if (-[EKEventViewControllerDefaultImpl allowsEditing](self, "allowsEditing"))
            {
              objc_msgSend(v71, "addObject:", v17);
              -[EKEventTitleDetailItem setCellPosition:](v17, "setCellPosition:", 5);
            }
LABEL_21:
            v24 = v17;
            v25 = 5;
LABEL_24:
            -[EKEventTitleDetailItem setCellPosition:](v24, "setCellPosition:", v25);
            goto LABEL_25;
          }
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            objc_msgSend(v5, "addObject:", v17);
            v24 = v17;
            v25 = 2;
            goto LABEL_24;
          }
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            if (!-[EKEventViewControllerDefaultImpl allowsEditing](self, "allowsEditing")
              || !-[EKEvent allowsAvailabilityModifications](self->_event, "allowsAvailabilityModifications"))
            {
              goto LABEL_25;
            }
LABEL_38:
            if (-[EKEventViewControllerDefaultImpl _backingEventAllowsEditing](self, "_backingEventAllowsEditing"))
              goto LABEL_25;
            v23 = v71;
          }
          else
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              if (!-[EKEventViewControllerDefaultImpl allowsEditing](self, "allowsEditing")
                || !-[EKEvent allowsPrivacyLevelModifications](self->_event, "allowsPrivacyLevelModifications"))
              {
                goto LABEL_25;
              }
              goto LABEL_38;
            }
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              if (!-[EKEventViewControllerDefaultImpl allowsEditing](self, "allowsEditing")
                || !-[EKEvent allowsTravelTimeModifications](self->_event, "allowsTravelTimeModifications"))
              {
                goto LABEL_25;
              }
              goto LABEL_38;
            }
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              objc_msgSend(v69, "addObject:", v17);
              v24 = v17;
              v25 = 4;
              goto LABEL_24;
            }
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              p_superclass = (__objc2_class **)(&OBJC_METACLASS___EKEventAttendeeDetailGroup + 8);
              if (!-[EKEventViewControllerDefaultImpl allowsEditing](self, "allowsEditing"))
                goto LABEL_21;
              -[EKEventViewControllerDefaultImpl event](self, "event");
              v26 = (void *)objc_claimAutoreleasedReturnValue();
              v47 = objc_msgSend(v26, "allowsProposedTimeModifications");

              if (!v47)
                goto LABEL_21;
              v23 = v5;
            }
            else
            {
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                objc_msgSend(v5, "lastObject");
                v27 = (EKEventTitleDetailItem *)objc_claimAutoreleasedReturnValue();
                v48 = v12;
                v28 = self->_titleItem;

                objc_msgSend(v5, "addObject:", v17);
                -[EKEventTitleDetailItem setCellPosition:](v17, "setCellPosition:", 5);
                v29 = v27 == v28;
                v12 = v48;
                p_superclass = (__objc2_class **)(&OBJC_METACLASS___EKEventAttendeeDetailGroup + 8);
                if (!v29)
                  goto LABEL_25;
                v30 = self->_titleItem;
                goto LABEL_50;
              }
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                objc_msgSend(v5, "addObject:", v17);
                -[EKEventTitleDetailItem setCellPosition:](v17, "setCellPosition:", 1);
                p_superclass = (__objc2_class **)(&OBJC_METACLASS___EKEventAttendeeDetailGroup + 8);
                goto LABEL_25;
              }
              objc_opt_class();
              p_superclass = (__objc2_class **)(&OBJC_METACLASS___EKEventAttendeeDetailGroup + 8);
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                event = self->_event;
                reminder = self->_reminder;
                -[EKEvent eventStore](event, "eventStore");
                v32 = objc_claimAutoreleasedReturnValue();
                v33 = event;
                v34 = (void *)v32;
                -[EKEventTitleDetailItem setEvent:reminder:store:](v17, "setEvent:reminder:store:", v33, reminder);

                objc_msgSend(v5, "addObject:", v17);
                v24 = v17;
                v25 = 1;
                goto LABEL_24;
              }
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) == 0)
              {
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) == 0)
                {
                  objc_opt_class();
                  isKindOfClass = objc_opt_isKindOfClass();
                  objc_msgSend(v5, "addObject:", v17);
                  -[EKEventTitleDetailItem setCellPosition:](v17, "setCellPosition:", 1);
                  if ((isKindOfClass & 1) != 0)
                  {
                    if (-[EKEventViewControllerDefaultImpl minimalMode](self, "minimalMode"))
                      v36 = -[EKEventViewControllerDefaultImpl noninteractivePlatterMode](self, "noninteractivePlatterMode") ^ 1;
                    else
                      v36 = 0;
                    -[EKEventTitleDetailItem setShowExtraSpaceAtBottom:](v17, "setShowExtraSpaceAtBottom:", v36);
                  }
                  goto LABEL_25;
                }
                objc_msgSend(v5, "addObject:", v17);
                -[EKEventTitleDetailItem setCellPosition:](v17, "setCellPosition:", 1);
                v30 = v17;
LABEL_50:
                -[EKEventTitleDetailItem setHidesBottomSeparator:](v30, "setHidesBottomSeparator:", 1);
                goto LABEL_25;
              }
              v23 = v56;
            }
          }
LABEL_16:
          objc_msgSend(v23, "addObject:", v17);
          goto LABEL_21;
        }
LABEL_25:

        if (++v14 >= (unint64_t)objc_msgSend(v4, "count"))
          goto LABEL_64;
      }
      if (!-[EKEventViewControllerDefaultImpl allowsCalendarPreview](self, "allowsCalendarPreview")
        || -[EKEventViewControllerDefaultImpl calendarPreviewIsInlineDayView](self, "calendarPreviewIsInlineDayView")
        || !-[EKEventTitleDetailItem configureWithCalendar:preview:](v17, "configureWithCalendar:preview:", v73, *((unsigned __int8 *)&self->super.super.super.isa + v16[490])))
      {
        goto LABEL_25;
      }
      v23 = v70;
      goto LABEL_16;
    }
LABEL_64:
    objc_msgSend(v5, "lastObject");
    v37 = objc_claimAutoreleasedReturnValue();
    if (v37)
    {
      v38 = (void *)v37;
      objc_msgSend(v5, "lastObject");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      v40 = objc_opt_isKindOfClass();

      if ((v40 & 1) != 0)
      {
        objc_msgSend(v5, "lastObject");
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v41, "setShowExtraSpaceAtBottom:", 1);

      }
    }
    if (objc_msgSend(v5, "count"))
    {
      v42 = objc_msgSend(v5, "count");
      objc_msgSend(v5, "objectAtIndex:", 0);
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      v44 = v43;
      if (v42 == 1)
      {
        v45 = 5;
      }
      else
      {
        objc_msgSend(v43, "setCellPosition:", 1);

        objc_msgSend(v5, "objectAtIndex:", objc_msgSend(v5, "count") - 1);
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        v44 = v43;
        v45 = 4;
      }
      objc_msgSend(v43, "setCellPosition:", v45);

    }
    if (objc_msgSend(v5, "count"))
    {
      -[EKEventDetailGroup setItems:](v66, "setItems:", v5);
      -[NSArray addObject:](v72, "addObject:", v66);
    }
    if (objc_msgSend(v71, "count"))
    {
      -[EKEventDetailGroup setItems:](v65, "setItems:", v71);
      -[NSArray addObject:](v72, "addObject:", v65);
    }
    if (objc_msgSend(v68, "count"))
    {
      -[EKEventDetailGroup setItems:](v64, "setItems:", v68);
      -[NSArray addObject:](v72, "addObject:", v64);
    }
    if (objc_msgSend(v55, "count"))
    {
      -[EKEventDetailGroup setItems:](v63, "setItems:", v55);
      -[NSArray addObject:](v72, "addObject:", v63);
    }
    if (objc_msgSend(v70, "count"))
    {
      -[EKEventDetailGroup setItems:](v59, "setItems:", v70);
      -[NSArray addObject:](v72, "addObject:", v59);
    }
    if (objc_msgSend(v54, "count"))
    {
      -[EKEventDetailGroup setItems:](v62, "setItems:", v54);
      -[NSArray addObject:](v72, "addObject:", v62);
    }
    if (objc_msgSend(v53, "count"))
    {
      -[EKEventDetailGroup setItems:](v61, "setItems:", v53);
      -[NSArray addObject:](v72, "addObject:", v61);
    }
    if (objc_msgSend(v12, "count"))
    {
      -[EKEventDetailGroup setItems:](v60, "setItems:", v12);
      -[NSArray addObject:](v72, "addObject:", v60);
    }
    if (objc_msgSend(v67, "count"))
    {
      -[EKEventDetailGroup setItems:](v58, "setItems:", v67);
      -[NSArray addObject:](v72, "addObject:", v58);
    }
    if (objc_msgSend(v69, "count"))
    {
      -[EKEventDetailGroup setItems:](v57, "setItems:", v69);
      -[NSArray addObject:](v72, "addObject:", v57);
    }
    if (objc_msgSend(v56, "count"))
    {
      -[EKEventDetailGroup setItems:](v51, "setItems:", v56);
      -[NSArray addObject:](v72, "addObject:", v51);
    }
    currentSections = self->_currentSections;
    self->_currentSections = v72;

  }
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
  int v8;
  int v9;
  void *v10;
  char v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;

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
  }
  else
  {
    v9 = 0;
  }

  if (-[EKEventViewControllerDefaultImpl _reminderMode](self, "_reminderMode"))
  {
    if ((-[EKEvent CUIK_reminderShouldBeEditable](self->_event, "CUIK_reminderShouldBeEditable") & v9 & 1) != 0)
      return 1;
  }
  else if ((v9 & 1) != 0)
  {
    return 1;
  }
  if (-[EKEvent status](self->_event, "status") != EKEventStatusCanceled)
    return 0;
  -[EKEvent calendar](self->_event, "calendar");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "source");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v13, "isDelegate"))
  {
    -[EKEvent calendar](self->_event, "calendar");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "source");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v15, "isWritable");

  }
  else
  {
    v11 = 1;
  }

  return v11;
}

- (BOOL)_isDisplayingInvitation
{
  int v3;

  v3 = -[EKEventViewControllerDefaultImpl allowsInviteResponses](self, "allowsInviteResponses");
  if (v3)
    LOBYTE(v3) = -[EKEvent allowsParticipationStatusModifications](self->_event, "allowsParticipationStatusModifications");
  return v3;
}

- (BOOL)_isDisplayingSelfOrganizedInvitation
{
  return -[EKEvent isSelfOrganizedInvitation](self->_event, "isSelfOrganizedInvitation");
}

- (BOOL)_shouldDisplayDelegateOrOutOfDateMessage
{
  return -[EKEventViewControllerDefaultImpl showsOutOfDateMessage](self, "showsOutOfDateMessage")
      || -[EKEventViewControllerDefaultImpl showsDelegatorMessage](self, "showsDelegatorMessage")
      || -[EKEventViewControllerDefaultImpl showsDelegateMessage](self, "showsDelegateMessage");
}

- (void)_updateHeaderAndFooterIfNeeded
{
  void *v3;
  void *v4;
  const __CFString *v5;
  UIView *v6;
  UIView *blankFooterView;
  UIView *v8;
  void *v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  objc_class *v14;
  id v15;
  void *v16;
  void *v17;
  double v18;
  double v19;
  void *v20;
  double v21;
  double v22;
  double v23;
  void *v24;
  BOOL v25;
  id v26;

  if (-[EKEventViewControllerDefaultImpl isViewLoaded](self, "isViewLoaded"))
  {
    if (!-[EKEventViewControllerDefaultImpl _shouldDisplayDelegateOrOutOfDateMessage](self, "_shouldDisplayDelegateOrOutOfDateMessage"))
    {
      if (!self->_blankFooterView)
      {
        v6 = (UIView *)objc_alloc_init(MEMORY[0x1E0DC3F10]);
        blankFooterView = self->_blankFooterView;
        self->_blankFooterView = v6;

      }
      if (!self->_showingBlankFooterView)
      {
        v8 = self->_blankFooterView;
        -[EKEventViewControllerDefaultImpl tableView](self, "tableView");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "setTableFooterView:", v8);

        self->_showingBlankFooterView = 1;
      }
      goto LABEL_18;
    }
    if (-[EKEventViewControllerDefaultImpl showsOutOfDateMessage](self, "showsOutOfDateMessage"))
    {
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = v3;
      v5 = CFSTR("This invitation data is out of date.");
    }
    else if (-[EKEventViewControllerDefaultImpl showsDelegatorMessage](self, "showsDelegatorMessage"))
    {
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = v3;
      v5 = CFSTR("This invitation is managed by your delegate.");
    }
    else
    {
      if (!-[EKEventViewControllerDefaultImpl showsDelegateMessage](self, "showsDelegateMessage"))
      {
        v10 = 0;
        goto LABEL_14;
      }
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = v3;
      v5 = CFSTR("You are being notified of this event because you are a delegate of an invitee.");
    }
    objc_msgSend(v3, "localizedStringForKey:value:table:", v5, &stru_1E601DFA8, 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_14:
    -[EKEventViewControllerDefaultImpl _footerLabelContainingText:](self, "_footerLabelContainingText:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "frame");
    v13 = v12 + 15.0;
    v14 = (objc_class *)MEMORY[0x1E0DC3F10];
    v15 = v11;
    v16 = (void *)objc_msgSend([v14 alloc], "initWithFrame:", 0.0, 0.0, 100.0, v13);
    objc_msgSend(v16, "addSubview:", v15);

    -[EKEventViewControllerDefaultImpl view](self, "view");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "bounds");
    v19 = v18;
    -[EKEventViewControllerDefaultImpl tableView](self, "tableView");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "rowHeight");
    v22 = v21;

    if (v13 >= v22)
      v23 = v13;
    else
      v23 = v22;
    objc_msgSend(v16, "setFrame:", 0.0, 0.0, v19, v23);

    -[EKEventViewControllerDefaultImpl tableView](self, "tableView");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "setTableFooterView:", v16);

    self->_showingBlankFooterView = 0;
LABEL_18:
    -[EKEventViewControllerDefaultImpl event](self, "event");
    v26 = (id)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v26, "couldBeJunk") & 1) != 0)
    {

    }
    else
    {
      v25 = -[UIView isHidden](self->_headerView, "isHidden");

      if (!v25)
      {
        -[UIView setHidden:](self->_headerView, "setHidden:", 1);
        objc_msgSend(MEMORY[0x1E0CB3718], "deactivateConstraints:", self->_headerConstraints);
        objc_msgSend(MEMORY[0x1E0CB3718], "activateConstraints:", self->_tableViewTopConstraints);
      }
    }
  }
}

- (id)_footerLabelContainingText:(id)a3
{
  objc_class *v4;
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  double v10;
  double v11;

  v4 = (objc_class *)MEMORY[0x1E0DC3990];
  v5 = a3;
  v6 = objc_alloc_init(v4);
  objc_msgSend(v6, "setText:", v5);

  objc_msgSend(MEMORY[0x1E0DC1350], "systemFontOfSize:", 14.0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setFont:", v7);

  objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setTextColor:", v8);

  objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setBackgroundColor:", v9);

  objc_msgSend(v6, "setNumberOfLines:", 0);
  v10 = EKUIContainedControllerIdealWidth();
  self->_lastFooterLayoutWidth = v10;
  objc_msgSend(v6, "setFrame:", 0.0, 0.0, v10 + -30.0, 1.79769313e308);
  objc_msgSend(v6, "sizeToFit");
  objc_msgSend(v6, "frame");
  objc_msgSend(v6, "setFrame:", 15.0, v11 + 6.0);
  return v6;
}

- (void)_setUpForEvent
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  EKEvent *event;
  REMReminder *reminder;
  void *v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  -[EKEventViewControllerDefaultImpl _prepareEventForEdit](self, "_prepareEventForEdit");
  -[EKEventViewControllerDefaultImpl items](self, "items");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "makeObjectsPerformSelector:withObject:", sel_setDelegate_, self);

  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  -[EKEventViewControllerDefaultImpl items](self, "items", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v15 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
        event = self->_event;
        reminder = self->_reminder;
        -[EKEvent eventStore](event, "eventStore");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "setEvent:reminder:store:", event, reminder, v12);

      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v6);
  }

  -[EKEvent calendar](self->_event, "calendar");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKEventViewControllerDefaultImpl _configureItemsForStoreConstraintsGivenCalendar:](self, "_configureItemsForStoreConstraintsGivenCalendar:", v13);

  -[EKEventViewControllerDefaultImpl _updateHeaderAndFooterIfNeeded](self, "_updateHeaderAndFooterIfNeeded");
  -[EKEventViewControllerDefaultImpl _updateStatusButtonsActions](self, "_updateStatusButtonsActions");
  -[EKEventViewControllerDefaultImpl _updateResponseVisibility](self, "_updateResponseVisibility");
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
    -[EKEventViewControllerDefaultImpl statusButtons](self, "statusButtons");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = -[EKUIEventStatusButtonsView initWithFrame:actions:delegate:options:](v4, "initWithFrame:actions:delegate:options:", v5, self, 1, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    v7 = self->_statusButtonsView;
    self->_statusButtonsView = v6;

    -[EKUIEventStatusButtonsView setTranslatesAutoresizingMaskIntoConstraints:](self->_statusButtonsView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[EKUIEventStatusButtonsView setDisableButtonHighlights:](self->_statusButtonsView, "setDisableButtonHighlights:", -[EKEventViewControllerDefaultImpl _isDisplayingInvitation](self, "_isDisplayingInvitation") ^ 1);
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

  -[EKEventViewControllerDefaultImpl statusButtons](self, "statusButtons");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[EKUIEventStatusButtonsView setActions:](self->_statusButtonsView, "setActions:", v3);

}

- (void)_notifyDetailItemsOfVisibilityOnScreen
{
  NSArray *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = self->_currentSections;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  -[UITableView indexPathsForVisibleRows](self->_tableView, "indexPathsForVisibleRows", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v14 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * i);
        -[NSArray objectAtIndex:](v3, "objectAtIndex:", objc_msgSend(v9, "section"));
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "itemAtIndex:", objc_msgSend(v9, "row"));
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        -[EKEventViewControllerDefaultImpl _ekEventViewController](self, "_ekEventViewController");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "eventViewController:tableViewDidScroll:", v12, self->_tableView);

      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v6);
  }

}

- (void)doneButtonTapped
{
  id v3;

  -[EKEventTitleDetailItem sourceViewForPopover](self->_titleItem, "sourceViewForPopover");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[EKEventViewControllerDefaultImpl _doneButtonTapped:](self, "_doneButtonTapped:", v3);

}

- (void)_doneButtonTapped:(id)a3
{
  id v4;
  EKEventDetailItem *selectedEditItem;
  _BOOL4 v6;
  char isKindOfClass;
  id v8;

  v4 = a3;
  if (!self->_recurrenceAlertController)
  {
    selectedEditItem = self->_selectedEditItem;
    v8 = v4;
    if (!selectedEditItem
      || (v6 = -[EKEventDetailItem saveAndDismissWithForce:](selectedEditItem, "saveAndDismissWithForce:", 0),
          v4 = v8,
          v6))
    {
      if (!-[EKEvent hasChanges](self->_event, "hasChanges"))
      {
        -[EKEventViewControllerDefaultImpl completeWithAction:](self, "completeWithAction:", 0);
        goto LABEL_12;
      }
      if (!-[EKEvent requiresDetach](self->_event, "requiresDetach"))
      {
        -[EKEventViewControllerDefaultImpl _performSave:animated:](self, "_performSave:animated:", 0, 1);
        goto LABEL_12;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        -[EKEventViewControllerDefaultImpl _presentDetachSheetFromBarButtonItem:](self, "_presentDetachSheetFromBarButtonItem:", v8);
LABEL_12:
        v4 = v8;
        goto LABEL_13;
      }
      objc_opt_class();
      isKindOfClass = objc_opt_isKindOfClass();
      v4 = v8;
      if ((isKindOfClass & 1) != 0)
      {
        -[EKEventViewControllerDefaultImpl _presentDetachSheetFromView:](self, "_presentDetachSheetFromView:", v8);
        goto LABEL_12;
      }
    }
  }
LABEL_13:

}

- (void)editButtonTapped
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
  void *v22;

  p_delegate = &self->_delegate;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (!WeakRetained)
    goto LABEL_4;
  v5 = WeakRetained;
  v6 = objc_loadWeakRetained((id *)p_delegate);
  v7 = objc_opt_respondsToSelector();

  if ((v7 & 1) == 0
    || (v8 = objc_loadWeakRetained((id *)p_delegate),
        -[EKEventViewControllerDefaultImpl _ekEventViewController](self, "_ekEventViewController"),
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
    if ((objc_msgSend(v16, "conformsToProtocol:", &unk_1EEED6910) & 1) != 0)
    {
      v17 = objc_loadWeakRetained((id *)p_delegate);
      v18 = objc_opt_respondsToSelector();

      if ((v18 & 1) != 0)
      {
        v19 = objc_loadWeakRetained((id *)p_delegate);
        -[EKEventViewControllerDefaultImpl _ekEventViewController](self, "_ekEventViewController");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = objc_msgSend(v19, "eventViewDelegateShouldCreateOwnEditViewController:", v20);

        if ((v21 & 1) != 0)
          goto LABEL_13;
      }
    }
    else
    {

    }
    +[EKEventEditViewController eventOrIntegrationViewControllerWithEvent:creationMethod:eventEditViewDelegate:](EKEventEditViewController, "eventOrIntegrationViewControllerWithEvent:creationMethod:eventEditViewDelegate:", self->_event, 0, self);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKEventViewControllerDefaultImpl setActiveEventEditor:](self, "setActiveEventEditor:", v22);

LABEL_13:
    -[EKEventViewControllerDefaultImpl presentEditorAnimated:](self, "presentEditorAnimated:", 1);
  }
}

- (id)activeEventEditor
{
  return self->_activeEventEditor;
}

- (void)setActiveEventEditor:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  _BOOL4 IsRegular;
  void *v8;
  char v9;
  id WeakRetained;
  EKEventOrIntegrationEditView *activeEventEditor;

  v4 = a3;
  objc_msgSend(v4, "setInternalEditViewDelegate:", self);
  -[EKEventViewControllerDefaultImpl view](self, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (EKUICurrentWidthSizeClassIsRegularInViewHierarchy(v5))
  {
    -[EKEventViewControllerDefaultImpl view](self, "view");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    IsRegular = EKUICurrentHeightSizeClassIsRegular(v6);

    if (IsRegular)
      objc_msgSend(v4, "setModalPresentationStyle:", 3);
  }
  else
  {

  }
  -[EKEventViewControllerDefaultImpl delegate](self, "delegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_opt_respondsToSelector();

  if ((v9 & 1) != 0)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(v4, "setModalPresentationStyle:", objc_msgSend(WeakRetained, "editorPresentationStyle"));

  }
  activeEventEditor = self->_activeEventEditor;
  self->_activeEventEditor = (EKEventOrIntegrationEditView *)v4;

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
  EKEventOrIntegrationEditView *v18;

  v3 = a3;
  v18 = self->_activeEventEditor;
  p_delegate = &self->_delegate;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (!objc_msgSend(WeakRetained, "conformsToProtocol:", &unk_1EEED6910))
    goto LABEL_6;
  v7 = objc_loadWeakRetained((id *)&self->_delegate);
  if ((objc_opt_respondsToSelector() & 1) == 0)
  {

LABEL_6:
    goto LABEL_7;
  }
  v8 = objc_loadWeakRetained((id *)&self->_delegate);
  -[EKEventViewControllerDefaultImpl _ekEventViewController](self, "_ekEventViewController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v8, "eventViewDelegateShouldHandlePresentationOfEditViewController:", v9);

  if (v10)
  {
    v11 = objc_loadWeakRetained((id *)&self->_delegate);
    -[EKEventViewControllerDefaultImpl _ekEventViewController](self, "_ekEventViewController");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "eventViewController:requestsDisplayOfEditViewController:animated:", v12, v18, v3);

LABEL_12:
    goto LABEL_13;
  }
LABEL_7:
  if (v18)
  {
    if ((_DWORD)v3
      && (v3 = -[EKEventViewControllerDefaultImpl editorShowTransition](self, "editorShowTransition"), (_DWORD)v3 == 8))
    {
      -[EKEventViewControllerDefaultImpl _viewControllerForEditorPresentation](self, "_viewControllerForEditorPresentation");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "presentViewController:animated:completion:", v18, 1, 0);
    }
    else
    {
      -[EKEventViewControllerDefaultImpl _viewControllerForEditorPresentation](self, "_viewControllerForEditorPresentation");
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
  EKEventViewControllerDefaultImpl *v4;

  -[EKEventViewControllerDefaultImpl navigationController](self, "navigationController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[EKEventViewControllerDefaultImpl navigationController](self, "navigationController");
    v4 = (EKEventViewControllerDefaultImpl *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = self;
  }
  return v4;
}

- (void)_saveStatus:(int64_t)a3 span:(int64_t)a4
{
  -[EKEvent setParticipationStatus:](self->_event, "setParticipationStatus:", a3);
  -[EKEvent setInvitationStatus:](self->_event, "setInvitationStatus:", 0);
  -[EKEventViewControllerDefaultImpl _performSave:animated:](self, "_performSave:animated:", a4, 1);
}

- (BOOL)_performSave:(int64_t)a3 animated:(BOOL)a4
{
  void *v6;
  EKEvent *event;
  char v8;
  id v9;
  void *v10;
  void *v11;
  uint64_t v12;
  id v14;

  -[UIResponder EKUI_editor](self, "EKUI_editor", a3, a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  event = self->_event;
  v14 = 0;
  v8 = objc_msgSend(v6, "saveEvent:span:error:", event, a3, &v14);
  v9 = v14;
  v10 = v9;
  if ((v8 & 1) == 0 && v9)
  {
    objc_msgSend(v9, "domain");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11 != (void *)*MEMORY[0x1E0CA9E60])
    {
LABEL_6:

      goto LABEL_7;
    }
    v12 = objc_msgSend(v10, "code");

    if (v12 == 1010)
    {
      -[EKEvent eventStore](self->_event, "eventStore");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "rollback");
      goto LABEL_6;
    }
  }
LABEL_7:
  -[EKEventViewControllerDefaultImpl completeWithAction:](self, "completeWithAction:", 1);

  return 1;
}

- (void)_presentValidationAlert:(id)a3
{
  PresentValidationAlert(self, a3);
}

- (void)_performDelete:(int64_t)a3 editor:(id)a4
{
  void *v6;
  id v7;
  void *v8;
  void *v9;
  _QWORD v10[5];

  v6 = (void *)MEMORY[0x1E0CAA068];
  v7 = a4;
  objc_msgSend(v6, "sharedInstance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "handleEventDeletion:", self->_event);

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", self->_event);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __58__EKEventViewControllerDefaultImpl__performDelete_editor___block_invoke;
  v10[3] = &unk_1E601B800;
  v10[4] = self;
  objc_msgSend(v7, "deleteEvents:span:result:", v9, a3, v10);

}

void __58__EKEventViewControllerDefaultImpl__performDelete_editor___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  id v10;

  v5 = a3;
  v10 = v5;
  if ((a2 & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "completeWithAction:", 2);
  }
  else
  {
    objc_msgSend(v5, "domain");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (v6 == (void *)*MEMORY[0x1E0CA9E60])
    {
      v8 = objc_msgSend(v10, "code");

      if (v8 == 1010)
      {
        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 976), "eventStore");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "rollback");

      }
    }
    else
    {

    }
  }

}

- (void)performAddToCalendar
{
  if (-[EKEventViewControllerDefaultImpl isICSPreview](self, "isICSPreview"))
  {
    if (-[EKEventViewControllerDefaultImpl showsAddToCalendarForICSPreview](self, "showsAddToCalendarForICSPreview"))
      -[EKEventViewControllerDefaultImpl _addToCalendarClicked:](self, "_addToCalendarClicked:", self);
  }
}

- (CGSize)preferredContentSize
{
  double v2;
  double v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  CGSize result;

  if (self->_activeEventEditor)
  {
    -[EKEventOrIntegrationEditView preferredContentSize](self->_activeEventEditor, "preferredContentSize");
  }
  else if (self->_currentEditItem)
  {
    -[EKEventDetailItem viewController](self->_currentEditItem, "viewController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "preferredContentSize");
    v6 = v5;
    v8 = v7;

    v2 = v6;
    v3 = v8;
  }
  else
  {
    -[EKEventViewControllerDefaultImpl _idealSize](self, "_idealSize");
  }
  result.height = v3;
  result.width = v2;
  return result;
}

- (double)tableViewSectionContentWidth
{
  void *v3;
  double v4;
  double v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;

  -[EKEventViewControllerDefaultImpl tableView](self, "tableView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  v5 = v4;

  -[EKEventViewControllerDefaultImpl tableView](self, "tableView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "_sectionContentInset");
  v8 = v7;
  v10 = v9;

  return v5 - (v8 + v10);
}

- (void)viewLayoutMarginsDidChange
{
  double v3;
  double v4;
  double v5;
  void *v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  uint64_t v10;
  uint64_t j;
  void *v12;
  void *v13;
  void *v14;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)EKEventViewControllerDefaultImpl;
  -[EKEventViewControllerDefaultImpl viewLayoutMarginsDidChange](&v15, sel_viewLayoutMarginsDidChange);
  -[EKEventViewControllerDefaultImpl preferredContentSize](self, "preferredContentSize");
  -[EKEventViewControllerDefaultImpl setPreferredContentSize:](self, "setPreferredContentSize:");
  -[EKEventViewControllerDefaultImpl tableViewSectionContentWidth](self, "tableViewSectionContentWidth");
  v4 = v3;
  if (v3 < 1.0)
  {
    -[EKEventViewControllerDefaultImpl preferredContentSize](self, "preferredContentSize");
    v4 = v5;
  }
  if (v4 >= 1.0)
  {
    -[EKEventViewControllerDefaultImpl tableView](self, "tableView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "numberOfSections");

    if (v7)
    {
      for (i = 0; i != v7; ++i)
      {
        -[EKEventViewControllerDefaultImpl tableView](self, "tableView");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = objc_msgSend(v9, "numberOfRowsInSection:", i);

        if (v10)
        {
          for (j = 0; j != v10; ++j)
          {
            objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForRow:inSection:", j, i);
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            -[EKEventViewControllerDefaultImpl tableView](self, "tableView");
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            -[EKEventViewControllerDefaultImpl tableView:cellForRowAtIndexPath:](self, "tableView:cellForRowAtIndexPath:", v13, v12);
            v14 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend((id)objc_opt_class(), "adjustLayoutForCell:tableViewWidth:numRowsInSection:cellRow:forceLayout:", v14, v10, j, 1, v4);
          }
        }
      }
    }
  }
}

- (void)setPresentationSourceViewController:(id)a3
{
  objc_storeStrong((id *)&self->_presentationSourceViewController, a3);
}

- (UIViewController)presentationSourceViewController
{
  UIViewController *presentationSourceViewController;
  void *v4;
  void *v5;
  EKEventViewControllerDefaultImpl *v6;
  void *v7;

  presentationSourceViewController = self->_presentationSourceViewController;
  if (presentationSourceViewController
    && (-[UIViewController view](presentationSourceViewController, "view"),
        v4 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v4, "window"),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        v5,
        v4,
        v5))
  {
    v6 = self->_presentationSourceViewController;
  }
  else
  {
    -[EKEventViewControllerDefaultImpl navigationController](self, "navigationController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      -[EKEventViewControllerDefaultImpl navigationController](self, "navigationController");
      v6 = (EKEventViewControllerDefaultImpl *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v6 = self;
    }
  }
  return (UIViewController *)v6;
}

- (id)presentationNavigationDelegate
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
    -[EKEventViewControllerDefaultImpl presentationSourceViewController](self, "presentationSourceViewController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v5;
}

- (void)_presentDetachSheetFromBarButtonItem:(id)a3
{
  id v4;
  void *v5;
  EKUIRecurrenceAlertController *v6;
  EKUIRecurrenceAlertController *recurrenceAlertController;
  id v8;

  v4 = a3;
  -[EKEventViewControllerDefaultImpl _detachSheetHandler](self, "_detachSheetHandler");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[EKEventViewControllerDefaultImpl presentationSourceViewController](self, "presentationSourceViewController");
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
  -[EKEventViewControllerDefaultImpl _detachSheetHandler](self, "_detachSheetHandler");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[EKEventViewControllerDefaultImpl presentationSourceViewController](self, "presentationSourceViewController");
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
  v6[2] = __55__EKEventViewControllerDefaultImpl__detachSheetHandler__block_invoke;
  v6[3] = &unk_1E601A878;
  v6[4] = self;
  v7 = v2;
  v3 = _Block_copy(v6);
  v4 = _Block_copy(v3);

  return v4;
}

void __55__EKEventViewControllerDefaultImpl__detachSheetHandler__block_invoke(uint64_t a1, uint64_t a2)
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
        objc_msgSend(v3, "_saveStatus:span:", v3[131], a2);
      else
        objc_msgSend(v3, "_performSave:animated:", a2, 1);
LABEL_7:
      v4 = *(_QWORD *)(a1 + 32);
      v5 = *(void **)(v4 + 1064);
      *(_QWORD *)(v4 + 1064) = 0;

      return;
  }
}

- (void)eventDetailItemAccessoryButtonTapped:(id)a3
{
  void *v4;
  id WeakRetained;
  void *v6;
  id v7;
  char v8;
  id v9;
  id v10;

  v10 = a3;
  if (-[EKEventViewControllerDefaultImpl allowsSubitems](self, "allowsSubitems"))
  {
    -[EKEventViewControllerDefaultImpl _ekEventViewController](self, "_ekEventViewController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "eventViewControllerDidTapInfoButton:", v4);

    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    if (WeakRetained)
    {
      v6 = WeakRetained;
      v7 = objc_loadWeakRetained((id *)&self->_delegate);
      v8 = objc_opt_respondsToSelector();

      if ((v8 & 1) != 0)
      {
        v9 = objc_loadWeakRetained((id *)&self->_delegate);
        objc_msgSend(v9, "performSelector:withObject:", sel_eventViewControllerDidReceiveEditUserInteraction_, self);

      }
    }
  }

}

- (void)eventDetailItemWantsRefeshForHeightChange
{
  void *v3;
  void *v4;

  if (self->_needsReload)
  {
    objc_msgSend(MEMORY[0x1E0DE7910], "cancelPreviousPerformRequestsWithTarget:selector:object:", self, sel__reloadIfNeeded, 0);
    -[EKEventViewControllerDefaultImpl _reloadIfNeeded](self, "_reloadIfNeeded");
  }
  else
  {
    -[EKEventViewControllerDefaultImpl tableView](self, "tableView");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "beginUpdates");

    -[EKEventViewControllerDefaultImpl tableView](self, "tableView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "endUpdates");

  }
  -[EKEventViewControllerDefaultImpl preferredContentSize](self, "preferredContentSize");
  -[EKEventViewControllerDefaultImpl setPreferredContentSize:](self, "setPreferredContentSize:");
}

- (void)eventItemDidStartEditing:(id)a3
{
  objc_storeStrong((id *)&self->_currentEditItem, a3);
}

- (void)eventItemDidSave:(id)a3
{
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;

  v8 = a3;
  v4 = objc_opt_class();
  if (v4 == objc_opt_class())
  {
    -[EKEvent calendar](self->_event, "calendar");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKEventViewControllerDefaultImpl _configureItemsForStoreConstraintsGivenCalendar:](self, "_configureItemsForStoreConstraintsGivenCalendar:", v5);

    -[UIResponder EKUI_setDataOwnersFromEvent:](self, "EKUI_setDataOwnersFromEvent:", self->_event);
  }
  v6 = objc_opt_class();
  if (v6 == objc_opt_class())
  {
    -[EKEventViewControllerDefaultImpl reloadReminderWithEKEvent:](self, "reloadReminderWithEKEvent:", self->_event);
    -[EKEventViewControllerDefaultImpl _setUpForEvent](self, "_setUpForEvent");
  }
  -[EKEventViewControllerDefaultImpl tableView](self, "tableView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "reloadData");

}

- (void)eventItemDidCommit:(id)a3
{
  void *v4;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[EKEventViewControllerDefaultImpl _ekEventViewController](self, "_ekEventViewController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "eventViewControllerModifiedEventWithoutEditing:", v4);

  }
}

- (void)eventDetailItemWantsRefresh:(id)a3
{
  id v4;
  NSArray *currentSections;
  id v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  uint64_t i;
  void *v11;
  void *v12;
  _QWORD v13[4];
  id v14;
  uint64_t *v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t v24;
  uint8_t buf[4];
  id v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v21 = 0;
  v22 = &v21;
  v23 = 0x2020000000;
  v24 = 0x7FFFFFFFFFFFFFFFLL;
  v17 = 0;
  v18 = &v17;
  v19 = 0x2020000000;
  currentSections = self->_currentSections;
  v20 = 0;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __64__EKEventViewControllerDefaultImpl_eventDetailItemWantsRefresh___block_invoke;
  v13[3] = &unk_1E601B850;
  v15 = &v17;
  v6 = v4;
  v14 = v6;
  v16 = &v21;
  -[NSArray enumerateObjectsUsingBlock:](currentSections, "enumerateObjectsUsingBlock:", v13);
  if (v22[3] == 0x7FFFFFFFFFFFFFFFLL)
  {
    v7 = kEKUILogHandle;
    if (os_log_type_enabled((os_log_t)kEKUILogHandle, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v26 = v6;
      _os_log_impl(&dword_1AF84D000, v7, OS_LOG_TYPE_ERROR, "Event detail item to reload (%@) not found", buf, 0xCu);
    }
  }
  else
  {
    v8 = objc_msgSend(v6, "numberOfSubitems");
    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", v8);
    if (v8)
    {
      for (i = 0; i != v8; ++i)
      {
        objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForRow:inSection:", i + v18[3], v22[3]);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "addObject:", v11);

      }
    }
    -[EKEventViewControllerDefaultImpl tableView](self, "tableView");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "reloadRowsAtIndexPaths:withRowAnimation:", v9, 0);

  }
  _Block_object_dispose(&v17, 8);
  _Block_object_dispose(&v21, 8);

}

void __64__EKEventViewControllerDefaultImpl_eventDetailItemWantsRefresh___block_invoke(uint64_t a1, void *a2, uint64_t a3, BOOL *a4)
{
  void *v7;
  _QWORD v8[4];
  id v9;
  int8x16_t v10;
  uint64_t v11;

  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 0;
  objc_msgSend(a2, "items");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __64__EKEventViewControllerDefaultImpl_eventDetailItemWantsRefresh___block_invoke_2;
  v8[3] = &unk_1E601B828;
  v9 = *(id *)(a1 + 32);
  v11 = a3;
  v10 = vextq_s8(*(int8x16_t *)(a1 + 40), *(int8x16_t *)(a1 + 40), 8uLL);
  objc_msgSend(v7, "enumerateObjectsUsingBlock:", v8);

  *a4 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) != 0x7FFFFFFFFFFFFFFFLL;
}

uint64_t __64__EKEventViewControllerDefaultImpl_eventDetailItemWantsRefresh___block_invoke_2(uint64_t result, void *a2, uint64_t a3, _BYTE *a4)
{
  uint64_t v4;

  v4 = result;
  if (*(void **)(result + 32) == a2)
  {
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_QWORD *)(result + 56);
    *a4 = 1;
  }
  else
  {
    result = objc_msgSend(a2, "numberOfSubitems");
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(v4 + 48) + 8) + 24) += result;
  }
  return result;
}

- (void)eventItemDidEndEditing:(id)a3
{
  EKEventDetailItem *currentEditItem;

  currentEditItem = self->_currentEditItem;
  self->_currentEditItem = 0;

}

- (void)eventItem:(id)a3 wantsViewControllerPresented:(id)a4
{
  id v5;
  id v6;

  v5 = a4;
  +[EKEditItemViewController preferredViewControllerForPresentationsFromViewController:](EKEditItemViewController, "preferredViewControllerForPresentationsFromViewController:", self);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "presentViewController:animated:completion:", v5, 1, 0);

}

- (void)_dismissEditor:(BOOL)a3 deleted:(BOOL)a4
{
  EKEventOrIntegrationEditView *activeEventEditor;
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
  EKEventOrIntegrationEditView *v19;
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
    if ((-[EKEventOrIntegrationEditView isBeingDismissed](activeEventEditor, "isBeingDismissed", a3) & 1) == 0)
    {
      WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      if (WeakRetained
        && (v8 = WeakRetained,
            v9 = objc_loadWeakRetained((id *)&self->_delegate),
            v10 = objc_msgSend(v9, "conformsToProtocol:", &unk_1EEED6910),
            v9,
            v8,
            v10))
      {
        v11 = objc_loadWeakRetained((id *)&self->_delegate);
        v12 = objc_opt_respondsToSelector();

        if ((v12 & 1) != 0)
        {
          v13 = objc_loadWeakRetained((id *)&self->_delegate);
          -[EKEventViewControllerDefaultImpl _ekEventViewController](self, "_ekEventViewController");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "eventViewControllerWillFinishEditingEvent:deleted:", v14, v6);

        }
        v15 = objc_loadWeakRetained((id *)&self->_delegate);
        v16 = objc_opt_respondsToSelector();

        v17 = objc_loadWeakRetained((id *)&self->_delegate);
        if ((v16 & 1) != 0)
        {
          -[EKEventViewControllerDefaultImpl _ekEventViewController](self, "_ekEventViewController");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "eventViewController:requestsDismissalOfEditViewController:", v18, self->_activeEventEditor);

        }
        else
        {
          v20 = objc_opt_respondsToSelector();

          if ((v20 & 1) != 0)
          {
            v21 = objc_loadWeakRetained((id *)&self->_delegate);
            -[EKEventViewControllerDefaultImpl _ekEventViewController](self, "_ekEventViewController");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v21, "eventViewController:willDismissEditViewController:deleted:", v22, self->_activeEventEditor, v6);

          }
          -[EKEventOrIntegrationEditView presentingViewController](self->_activeEventEditor, "presentingViewController");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "dismissViewControllerWithTransition:completion:", -[EKEventViewControllerDefaultImpl editorHideTransition](self, "editorHideTransition"), 0);

          v24 = objc_loadWeakRetained((id *)&self->_delegate);
          v25 = objc_opt_respondsToSelector();

          if ((v25 & 1) == 0)
            goto LABEL_12;
          v17 = objc_loadWeakRetained((id *)&self->_delegate);
          -[EKEventViewControllerDefaultImpl _ekEventViewController](self, "_ekEventViewController");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "eventViewController:didDismissEditViewController:deleted:", v26, self->_activeEventEditor, v6);

        }
      }
      else
      {
        -[EKEventOrIntegrationEditView presentingViewController](self->_activeEventEditor, "presentingViewController");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "dismissViewControllerWithTransition:completion:", -[EKEventViewControllerDefaultImpl editorHideTransition](self, "editorHideTransition"), 0);
      }

LABEL_12:
      -[EKEventOrIntegrationEditView setInternalEditViewDelegate:](self->_activeEventEditor, "setInternalEditViewDelegate:", 0);
      v19 = self->_activeEventEditor;
      self->_activeEventEditor = 0;

    }
  }
}

- (void)fullReloadWithNewEvent:(id)a3
{
  id v4;
  NSArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  REMReminder *reminder;
  void *v12;
  void *v13;
  void *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[EKEventViewControllerDefaultImpl setEvent:](self, "setEvent:", v4);
  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v5 = self->_items;
  v6 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v16;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v16 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * v9);
        reminder = self->_reminder;
        objc_msgSend(v4, "eventStore", (_QWORD)v15);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "setEvent:reminder:store:", v4, reminder, v12);

        ++v9;
      }
      while (v7 != v9);
      v7 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v7);
  }

  -[EKEvent calendar](self->_event, "calendar");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKEventViewControllerDefaultImpl _configureItemsForStoreConstraintsGivenCalendar:](self, "_configureItemsForStoreConstraintsGivenCalendar:", v13);

  -[EKEventViewControllerDefaultImpl setNeedsReload](self, "setNeedsReload");
  -[EKEventViewControllerDefaultImpl tableView](self, "tableView");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "reloadData");

}

- (BOOL)eventDetailItemShouldPresentShareSheet:(id)a3
{
  EKEventViewDelegate **p_delegate;
  id WeakRetained;
  char v6;
  id v7;
  void *v8;
  char v9;

  p_delegate = &self->_delegate;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) == 0)
    return 1;
  v7 = objc_loadWeakRetained((id *)p_delegate);
  -[EKEventViewControllerDefaultImpl _ekEventViewController](self, "_ekEventViewController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v7, "eventViewControllerShouldPresentShareSheet:", v8);

  return v9;
}

- (void)eventDetailItem:(id)a3 requestPresentShareSheetWithActivityItems:(id)a4 withPopoverSourceView:(id)a5
{
  id v7;
  id WeakRetained;
  char v9;
  id v10;
  void *v11;
  id v12;

  v12 = a4;
  v7 = a5;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v9 = objc_opt_respondsToSelector();

  if ((v9 & 1) != 0)
  {
    v10 = objc_loadWeakRetained((id *)&self->_delegate);
    -[EKEventViewControllerDefaultImpl _ekEventViewController](self, "_ekEventViewController");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "eventViewController:requestPresentShareSheetWithActivityItems:withPopoverSourceView:", v11, v12, v7);

  }
}

- (void)_eventEditViewControllerDidCompleteWithAction:(int64_t)a3
{
  void *v5;
  id v6;

  if (a3 == 2)
  {
    -[EKEventViewControllerDefaultImpl completeWithAction:](self, "completeWithAction:");
  }
  else
  {
    -[EKEventViewControllerDefaultImpl setNeedsReload](self, "setNeedsReload");
    -[EKEventViewControllerDefaultImpl _dismissEditor:deleted:](self, "_dismissEditor:deleted:", 1, 0);
    if (a3 == 1)
    {
      -[EKEvent calendar](self->_event, "calendar");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[EKEventViewControllerDefaultImpl _configureItemsForStoreConstraintsGivenCalendar:](self, "_configureItemsForStoreConstraintsGivenCalendar:", v5);

      -[EKEventViewControllerDefaultImpl tableView](self, "tableView");
      v6 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "reloadData");

    }
  }
}

- (void)eventEditViewController:(id)a3 didCompleteWithAction:(int64_t)a4
{
  -[EKEventViewControllerDefaultImpl eventEditViewController:didCompleteWithAction:completionHandler:](self, "eventEditViewController:didCompleteWithAction:completionHandler:", a3, a4, 0);
}

- (void)eventEditViewController:(id)a3 didCompleteWithAction:(int64_t)a4 completionHandler:(id)a5
{
  void *v6;
  EKEventEditViewController *editViewControllerForPasteboard;
  EKEventViewController *strongSelf;

  if (self->_editViewControllerForPasteboard == a3)
  {
    objc_msgSend(a3, "presentingViewController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "dismissViewControllerAnimated:completion:", 1, 0);

    editViewControllerForPasteboard = self->_editViewControllerForPasteboard;
    self->_editViewControllerForPasteboard = 0;

    strongSelf = self->_strongSelf;
    self->_strongSelf = 0;

  }
  else
  {
    -[EKEventViewControllerDefaultImpl _eventEditViewControllerDidCompleteWithAction:](self, "_eventEditViewControllerDidCompleteWithAction:", a4);
  }
}

- (id)pasteboardManagerForEventEditViewController:(id)a3
{
  void *v4;
  char v5;
  id WeakRetained;
  void *v7;

  -[EKEventViewControllerDefaultImpl delegate](self, "delegate", a3);
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

- (void)attemptDisplayReviewPrompt
{
  EKEventViewDelegate **p_delegate;
  id WeakRetained;
  char v4;
  id v5;

  p_delegate = &self->_delegate;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) != 0)
  {
    v5 = objc_loadWeakRetained((id *)p_delegate);
    objc_msgSend(v5, "attemptDisplayReviewPrompt");

  }
}

- (void)_prepareEventForEdit
{
  void *v3;
  EKEvent *event;
  void *v5;
  void *v6;
  void *v7;
  EKEvent *v8;
  void *v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  -[EKEvent calendar](self->_event, "calendar");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    event = self->_event;
    -[EKEvent eventStore](event, "eventStore");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "defaultCalendarForNewEvents");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKEvent setCalendar:](event, "setCalendar:", v6);

  }
  -[EKEvent startDate](self->_event, "startDate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
    objc_msgSend((id)objc_opt_class(), "setDefaultDatesForEvent:", self->_event);
  v8 = self->_event;
  v10[0] = *MEMORY[0x1E0D0B858];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKEvent prefetchAttendeesWithAdditionalProperties:](v8, "prefetchAttendeesWithAdditionalProperties:", v9);

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
          -[EKEventViewControllerDefaultImpl _saveStatus:sourceViewForPopover:](self, "_saveStatus:sourceViewForPopover:", v8, v6);
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
        -[EKEventViewControllerDefaultImpl _deleteSuggestionTapped:](self, "_deleteSuggestionTapped:", self);
      }
      else if (a3 == 2048)
      {
LABEL_15:
        -[EKEventViewControllerDefaultImpl _addToCalendarClicked:](self, "_addToCalendarClicked:", self);
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
      -[EKEventViewControllerDefaultImpl _statusButtonsView](self, "_statusButtonsView");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[EKEventViewControllerDefaultImpl _unsubscribeClicked:](self, "_unsubscribeClicked:", v9);
      goto LABEL_27;
    }
    if (a3 != 0x80000)
      goto LABEL_28;
LABEL_19:
    -[EKEventViewControllerDefaultImpl _statusButtonsView](self, "_statusButtonsView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKEventViewControllerDefaultImpl _deleteClicked:](self, "_deleteClicked:", v9);
LABEL_27:

    goto LABEL_28;
  }
  switch(a3)
  {
    case 0x1000:
      -[EKEventViewControllerDefaultImpl _acceptProposedTimeWithSourceViewForPopover:](self, "_acceptProposedTimeWithSourceViewForPopover:", v6);
      break;
    case 0x2000:
      -[EKEventViewControllerDefaultImpl _rejectProposedTime](self, "_rejectProposedTime");
      break;
    case 0x8000:
      -[EKEventViewControllerDefaultImpl _cancelProposedTime](self, "_cancelProposedTime");
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
  -[EKEventViewControllerDefaultImpl event](self, "event", 0);
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
            -[EKEventViewControllerDefaultImpl event](self, "event");
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
  -[EKEventViewControllerDefaultImpl _proposedDate](self, "_proposedDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    -[EKEventViewControllerDefaultImpl event](self, "event");
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
      -[EKEventViewControllerDefaultImpl presentationSourceViewController](self, "presentationSourceViewController");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "bounds");
      v22[0] = MEMORY[0x1E0C809B0];
      v22[1] = 3221225472;
      v22[2] = __80__EKEventViewControllerDefaultImpl__acceptProposedTimeWithSourceViewForPopover___block_invoke;
      v22[3] = &unk_1E60197E8;
      v22[4] = self;
      +[EKUIRecurrenceAlertController presentDetachAlertWithOptions:viewController:sourceView:sourceRect:forEvent:withCompletionHandler:](EKUIRecurrenceAlertController, "presentDetachAlertWithOptions:viewController:sourceView:sourceRect:forEvent:withCompletionHandler:", 0, v19, v4, v6, v22);
      v20 = (EKUIRecurrenceAlertController *)objc_claimAutoreleasedReturnValue();
      recurrenceAlertController = self->_recurrenceAlertController;
      self->_recurrenceAlertController = v20;

    }
    else
    {
      -[EKEventViewControllerDefaultImpl _performSave:animated:](self, "_performSave:animated:", 0, 0);
    }

  }
}

void __80__EKEventViewControllerDefaultImpl__acceptProposedTimeWithSourceViewForPopover___block_invoke(uint64_t a1, uint64_t a2)
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
    v7 = *(void **)(v6 + 1064);
    *(_QWORD *)(v6 + 1064) = 0;

    objc_msgSend(*(id *)(a1 + 32), "_performSave:animated:", v5, 0);
  }
  else
  {
    v3 = *(_QWORD *)(a1 + 32);
    v4 = *(void **)(v3 + 1064);
    *(_QWORD *)(v3 + 1064) = 0;

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
  -[EKEventViewControllerDefaultImpl event](self, "event", 0);
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

  -[EKEventViewControllerDefaultImpl event](self, "event");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v11, "isOrWasPartOfRecurringSeries"))
    v12 = 4;
  else
    v12 = 0;

  -[EKEventViewControllerDefaultImpl _performSave:animated:](self, "_performSave:animated:", v12, 0);
}

- (void)_cancelProposedTime
{
  void *v3;

  -[EKEventViewControllerDefaultImpl event](self, "event");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setProposedStartDate:", 0);

  -[EKEventViewControllerDefaultImpl _performSave:animated:](self, "_performSave:animated:", 0, 0);
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
      if (-[EKEvent isOrWasPartOfRecurringSeries](self->_event, "isOrWasPartOfRecurringSeries")
        && (-[EKEvent isSignificantlyDetached](self->_event, "isSignificantlyDetached") & 1) == 0)
      {
        self->_pendingStatus = a3;
        -[EKEventViewControllerDefaultImpl _presentDetachSheetFromView:](self, "_presentDetachSheetFromView:", v8);
        goto LABEL_8;
      }
      v7 = 0;
    }
    -[EKEventViewControllerDefaultImpl _saveStatus:span:](self, "_saveStatus:span:", a3, v7);
LABEL_8:
    v6 = v8;
  }

}

- (void)_deleteClicked:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  id WeakRetained;
  id v9;
  void *v10;
  int v11;
  id v12;
  void (**v13)(void *, _QWORD);
  uint64_t v14;
  EKUIRecurrenceAlertController *v15;
  EKUIRecurrenceAlertController *recurrenceAlertController;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  EKUIRecurrenceAlertController *v21;
  EKUIRecurrenceAlertController *v22;
  _QWORD aBlock[5];
  id v24;
  char v25;
  BOOL v26;

  v4 = a3;
  -[EKEventViewControllerDefaultImpl event](self, "event");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "status");

  -[UIResponder EKUI_editor](self, "EKUI_editor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v9 = objc_loadWeakRetained((id *)&self->_delegate);
    -[EKEventViewControllerDefaultImpl _ekEventViewController](self, "_ekEventViewController");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "eventViewDelegateShouldHandlePresentationOfDeleteAlert:", v10);

  }
  else
  {
    v11 = 0;
  }

  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __51__EKEventViewControllerDefaultImpl__deleteClicked___block_invoke;
  aBlock[3] = &unk_1E601B8A0;
  v25 = v11;
  aBlock[4] = self;
  v12 = v7;
  v24 = v12;
  v26 = v6 == 3;
  v13 = (void (**)(void *, _QWORD))_Block_copy(aBlock);
  if (v6 == 3)
    v14 = 5;
  else
    v14 = 4;
  if (v11)
  {
    +[EKUIRecurrenceAlertController deleteAlertWithOptions:forEvent:stringForDeleteButton:withCompletionHandler:](EKUIRecurrenceAlertController, "deleteAlertWithOptions:forEvent:stringForDeleteButton:withCompletionHandler:", v14, self->_event, 0, v13);
    v15 = (EKUIRecurrenceAlertController *)objc_claimAutoreleasedReturnValue();
    recurrenceAlertController = self->_recurrenceAlertController;
    self->_recurrenceAlertController = v15;

    if (!self->_recurrenceAlertController)
    {
      v13[2](v13, 0);
      goto LABEL_16;
    }
    v17 = objc_loadWeakRetained((id *)&self->_delegate);
    -[EKEventViewControllerDefaultImpl _ekEventViewController](self, "_ekEventViewController");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKUIRecurrenceAlertController alertController](self->_recurrenceAlertController, "alertController");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "eventViewController:requestsDisplayOfDeleteAlert:", v18, v19);

  }
  else
  {
    -[EKEventViewControllerDefaultImpl presentationSourceViewController](self, "presentationSourceViewController");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v4, "centerButton");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v20 = 0;
    }
    objc_msgSend(v20, "bounds");
    +[EKUIRecurrenceAlertController presentDeleteAlertWithOptions:viewController:sourceView:sourceRect:forEvent:stringForDeleteButton:withCompletionHandler:](EKUIRecurrenceAlertController, "presentDeleteAlertWithOptions:viewController:sourceView:sourceRect:forEvent:stringForDeleteButton:withCompletionHandler:", v14, v17, v20, self->_event, 0, v13);
    v21 = (EKUIRecurrenceAlertController *)objc_claimAutoreleasedReturnValue();
    v22 = self->_recurrenceAlertController;
    self->_recurrenceAlertController = v21;

  }
LABEL_16:

}

void __51__EKEventViewControllerDefaultImpl__deleteClicked___block_invoke(uint64_t a1, uint64_t a2)
{
  EKUIEventViewDelegateAlertDisplayer *v4;
  id WeakRetained;
  EKUIEventViewDelegateAlertDisplayer *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  _QWORD v10[5];
  id v11;
  uint64_t v12;
  char v13;
  uint64_t v14;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x1E0C80C00];
  if (*(_BYTE *)(a1 + 48))
  {
    v14 = *MEMORY[0x1E0D0C9E8];
    v4 = [EKUIEventViewDelegateAlertDisplayer alloc];
    WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 1320));
    v6 = -[EKUIEventViewDelegateAlertDisplayer initWithDelegate:eventViewController:](v4, "initWithDelegate:eventViewController:", WeakRetained, *(_QWORD *)(a1 + 32));
    v15[0] = v6;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v15, &v14, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = 0;
  }
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __51__EKEventViewControllerDefaultImpl__deleteClicked___block_invoke_2;
  v10[3] = &unk_1E601B878;
  v9 = *(_QWORD *)(a1 + 32);
  v8 = *(void **)(a1 + 40);
  v12 = a2;
  v10[4] = v9;
  v13 = *(_BYTE *)(a1 + 49);
  v11 = v8;
  objc_msgSend(v11, "performWithOptions:block:", v7, v10);

}

uint64_t __51__EKEventViewControllerDefaultImpl__deleteClicked___block_invoke_2(uint64_t result)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v1 = *(_QWORD *)(result + 48);
  if (v1 == 2)
  {
    v3 = *(_QWORD *)(result + 40);
    v4 = *(void **)(result + 32);
    v2 = 2;
  }
  else if (v1 == 1)
  {
    v3 = *(_QWORD *)(result + 40);
    v4 = *(void **)(result + 32);
    v2 = 1;
  }
  else
  {
    if (v1)
      return result;
    v2 = 2 * *(unsigned __int8 *)(result + 56);
    v3 = *(_QWORD *)(result + 40);
    v4 = *(void **)(result + 32);
  }
  return objc_msgSend(v4, "_performDelete:editor:", v2, v3);
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
  aBlock[2] = __56__EKEventViewControllerDefaultImpl__unsubscribeClicked___block_invoke;
  aBlock[3] = &unk_1E60197E8;
  aBlock[4] = self;
  v5 = _Block_copy(aBlock);
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if ((objc_opt_respondsToSelector() & 1) == 0)
  {

    goto LABEL_5;
  }
  v7 = objc_loadWeakRetained((id *)&self->_delegate);
  -[EKEventViewControllerDefaultImpl _ekEventViewController](self, "_ekEventViewController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v7, "eventViewDelegateShouldHandlePresentationOfDeleteAlert:", v8);

  if (!v9)
  {
LABEL_5:
    -[EKEventViewControllerDefaultImpl presentationSourceViewController](self, "presentationSourceViewController");
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
  -[EKEventViewControllerDefaultImpl _ekEventViewController](self, "_ekEventViewController");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKUIRecurrenceAlertController alertController](self->_recurrenceAlertController, "alertController");
  recurrenceAlertController = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "eventViewController:requestsDisplayOfDeleteAlert:", v13, recurrenceAlertController);
LABEL_6:

}

void __56__EKEventViewControllerDefaultImpl__unsubscribeClicked___block_invoke(uint64_t a1, uint64_t a2)
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
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 976), "calendar");
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

  if (-[EKEventViewControllerDefaultImpl _isDisplayingSuggestion](self, "_isDisplayingSuggestion", a3))
  {
    -[EKEvent suggestionInfo](self->_event, "suggestionInfo");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setChangedFields:", 0);

    -[EKEventViewControllerDefaultImpl attemptDisplayReviewPrompt](self, "attemptDisplayReviewPrompt");
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
    -[EKEventViewControllerDefaultImpl _ekEventViewController](self, "_ekEventViewController");
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

  if (-[EKEventViewControllerDefaultImpl _isDisplayingSuggestion](self, "_isDisplayingSuggestion", a3))
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
    -[EKEventViewControllerDefaultImpl _ekEventViewController](self, "_ekEventViewController");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "eventViewController:didCompleteWithAction:", v9, 2);

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
  if (-[EKEventViewControllerDefaultImpl _shouldDisplayStatusButtons](self, "_shouldDisplayStatusButtons"))
  {
    -[EKEventViewControllerDefaultImpl navigationController](self, "navigationController");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setToolbarHidden:", 0);

    -[EKEventViewControllerDefaultImpl toolbarItems](self, "toolbarItems");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v4
      || (statusButtonsContainerView = self->_statusButtonsContainerView, v4, !statusButtonsContainerView))
    {
      -[EKEventViewControllerDefaultImpl _statusButtonsContainerView](self, "_statusButtonsContainerView");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[EKEventViewControllerDefaultImpl _statusButtonsView](self, "_statusButtonsView");
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
      -[EKEventViewControllerDefaultImpl setToolbarItems:animated:](self, "setToolbarItems:animated:", v16, 1);

    }
  }
  else
  {
    -[EKEventViewControllerDefaultImpl toolbarItems](self, "toolbarItems");
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    if (v17)
    {
      -[EKEventViewControllerDefaultImpl navigationController](self, "navigationController");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "setToolbarHidden:", 1);

      -[EKEventViewControllerDefaultImpl setToolbarItems:animated:](self, "setToolbarItems:animated:", 0, 1);
    }
  }
}

- (void)_updateResponse
{
  uint64_t v3;
  EKEvent *event;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  uint64_t v11;
  id v12;

  -[EKEventViewControllerDefaultImpl _statusButtonsView](self, "_statusButtonsView");
  v3 = objc_claimAutoreleasedReturnValue();
  event = self->_event;
  v12 = (id)v3;
  if (self->_trustsStatus)
  {
    v5 = -[EKEvent participationStatus](event, "participationStatus");
  }
  else
  {
    -[EKEvent calendar](event, "calendar");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (v6)
    {
      objc_msgSend(v6, "source");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "constraints");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "statusesAreAccurate") ^ 1;

    }
    else
    {
      v10 = 0;
    }

    v5 = -[EKEvent participationStatus](self->_event, "participationStatus");
    if (v10 && !-[EKEvent isStatusDirty](self->_event, "isStatusDirty"))
      goto LABEL_11;
  }
  if (-[EKEventViewControllerDefaultImpl _isDisplayingSuggestion](self, "_isDisplayingSuggestion")
    || (unint64_t)(v5 - 2) > 2)
  {
LABEL_11:
    v11 = 0;
    goto LABEL_12;
  }
  v11 = qword_1AFA13830[v5 - 2];
LABEL_12:
  objc_msgSend(v12, "setSelectedAction:", v11);

}

- (BOOL)_shouldDisplayStatusButtons
{
  void *v2;
  BOOL v3;

  -[EKEventViewControllerDefaultImpl statusButtons](self, "statusButtons");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count") != 0;

  return v3;
}

- (int64_t)_actionsMask
{
  int64_t v3;
  BOOL v4;
  uint64_t v5;
  void *v6;
  void *v7;

  if (-[EKEventViewControllerDefaultImpl _shouldDisplayDelegateOrOutOfDateMessage](self, "_shouldDisplayDelegateOrOutOfDateMessage"))
  {
    return 0;
  }
  if (!-[EKEventViewControllerDefaultImpl _isDisplayingInvitation](self, "_isDisplayingInvitation"))
  {
    if (-[EKEventViewControllerDefaultImpl isICSPreview](self, "isICSPreview"))
    {
      if (-[EKEventViewControllerDefaultImpl showsAddToCalendarForICSPreview](self, "showsAddToCalendarForICSPreview"))
      {
        v3 = 8;
        goto LABEL_13;
      }
      v4 = !-[EKEventViewControllerDefaultImpl showsUpdateCalendarForICSPreview](self, "showsUpdateCalendarForICSPreview");
      v5 = 2048;
    }
    else
    {
      v4 = !-[EKEventViewControllerDefaultImpl _isDisplayingSuggestion](self, "_isDisplayingSuggestion");
      v5 = 136;
    }
    if (v4)
      v3 = 0;
    else
      v3 = v5;
LABEL_13:
    if (-[EKEventViewControllerDefaultImpl _isDisplayingDeletableEvent](self, "_isDisplayingDeletableEvent")
      && (!-[EKEventViewControllerDefaultImpl isICSPreview](self, "isICSPreview")
       || -[EKEventViewControllerDefaultImpl showsDeleteForICSPreview](self, "showsDeleteForICSPreview")))
    {
      if (-[EKEventViewControllerDefaultImpl _reminderMode](self, "_reminderMode"))
        v3 |= 0x80000uLL;
      else
        v3 |= 0x10uLL;
    }
    goto LABEL_19;
  }
  v3 = 7;
LABEL_19:
  -[EKEventViewControllerDefaultImpl event](self, "event");
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
    if ((_orderedActionsForMask__actionOrder_0[i] & a3) != 0)
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
  return (id)objc_msgSend((id)objc_opt_class(), "_orderedActionsForMask:", -[EKEventViewControllerDefaultImpl _actionsMask](self, "_actionsMask"));
}

- (void)eventStatusButtonsView:(id)a3 didSelectAction:(int64_t)a4 appliesToAll:(BOOL)a5 ifCancelled:(id)a6
{
  -[EKEventViewControllerDefaultImpl invokeAction:eventStatusButtonsView:](self, "invokeAction:eventStatusButtonsView:", a4, a3, a5, a6);
}

- (double)eventStatusButtonsViewButtonFontSize:(id)a3
{
  return self->_statusButtonsViewCachedFontSize;
}

- (void)eventStatusButtonsView:(id)a3 calculatedFontSizeToFit:(double)a4
{
  self->_statusButtonsViewCachedFontSize = a4;
}

- (void)viewWillLayoutSubviews
{
  double lastFooterLayoutWidth;
  void *v4;
  void *v5;
  id v6;

  if (!self->_showingBlankFooterView)
  {
    lastFooterLayoutWidth = self->_lastFooterLayoutWidth;
    if (lastFooterLayoutWidth != EKUIContainedControllerIdealWidth())
      -[EKEventViewControllerDefaultImpl _updateHeaderAndFooterIfNeeded](self, "_updateHeaderAndFooterIfNeeded");
  }
  -[EKEventViewControllerDefaultImpl navigationController](self, "navigationController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "toolbar");
  v6 = (id)objc_claimAutoreleasedReturnValue();

  v5 = v6;
  if (v6)
  {
    -[SingleToolbarItemContainerView setBoundsWithToolbar:](self->_statusButtonsContainerView, "setBoundsWithToolbar:", v6);
    v5 = v6;
  }

}

- (id)_sectionAtIndex:(int64_t)a3
{
  NSArray *v4;
  NSArray *v5;
  void *v6;

  v4 = self->_currentSections;
  v5 = v4;
  if (a3 < 0 || -[NSArray count](v4, "count") <= a3)
  {
    v6 = 0;
  }
  else
  {
    -[NSArray objectAtIndexedSubscript:](v5, "objectAtIndexedSubscript:", a3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v6;
}

- (id)_itemAtIndexPath:(id)a3 section:(id *)a4 subitemIndex:(unint64_t *)a5
{
  id v8;
  void *v9;
  uint64_t v10;
  void *v11;

  v8 = a3;
  -[EKEventViewControllerDefaultImpl _sectionAtIndex:](self, "_sectionAtIndex:", objc_msgSend(v8, "section"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v8, "row");

  objc_msgSend(v9, "itemAtIndex:subitemIndex:", v10, a5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (a4)
    *a4 = objc_retainAutorelease(v9);

  return v11;
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return -[NSArray count](self->_currentSections, "count", a3);
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  id v6;
  void *v7;
  double v8;
  double v9;
  uint64_t v10;
  int64_t v11;

  v6 = a3;
  -[EKEventViewControllerDefaultImpl _sectionAtIndex:](self, "_sectionAtIndex:", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "frame");
  if (v8 > 0.0)
  {
    objc_msgSend(v6, "frame");
    objc_msgSend(v7, "updateCellLayoutsForRowCountIfNeededUsingWidth:", v9);
  }
  v10 = objc_msgSend(v7, "numberOfRows");
  v11 = v10;
  if (self->_disclosedTableSection == a4)
    v11 = self->_disclosedTableRange.length + v10;

  return v11;
}

- (void)viewDidLayoutSubviews
{
  double v3;
  double v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  uint64_t v11;
  uint64_t j;
  void *v13;
  void *v14;
  void *v15;
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)EKEventViewControllerDefaultImpl;
  -[EKEventViewControllerDefaultImpl viewDidLayoutSubviews](&v16, sel_viewDidLayoutSubviews);
  -[EKEventViewControllerDefaultImpl tableViewSectionContentWidth](self, "tableViewSectionContentWidth");
  v4 = v3;
  if (v3 >= 10.0)
  {
    -[EKEventViewControllerDefaultImpl view](self, "view");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "window");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      -[EKEventViewControllerDefaultImpl tableView](self, "tableView");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "numberOfSections");

      if (v8)
      {
        for (i = 0; i != v8; ++i)
        {
          -[EKEventViewControllerDefaultImpl tableView](self, "tableView");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          v11 = objc_msgSend(v10, "numberOfRowsInSection:", i);

          if (v11)
          {
            for (j = 0; j != v11; ++j)
            {
              objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForRow:inSection:", j, i);
              v13 = (void *)objc_claimAutoreleasedReturnValue();
              -[EKEventViewControllerDefaultImpl tableView](self, "tableView");
              v14 = (void *)objc_claimAutoreleasedReturnValue();
              -[EKEventViewControllerDefaultImpl tableView:cellForRowAtIndexPath:](self, "tableView:cellForRowAtIndexPath:", v14, v13);
              v15 = (void *)objc_claimAutoreleasedReturnValue();

              objc_msgSend((id)objc_opt_class(), "adjustLayoutForCell:tableViewWidth:numRowsInSection:cellRow:forceLayout:", v15, v11, j, 0, v4);
            }
          }
        }
      }
    }
  }
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
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
  double v21;
  double v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  NSObject *v32;
  int v34;
  id v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = objc_msgSend(v7, "section");
  -[EKEventViewControllerDefaultImpl _sectionAtIndex:](self, "_sectionAtIndex:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v9)
    goto LABEL_19;
  v10 = objc_msgSend(v7, "row");
  -[EKEventViewControllerDefaultImpl view](self, "view");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "window");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    -[EKEventViewControllerDefaultImpl view](self, "view");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "window");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    EKUIPushFallbackSizingContextWithViewHierarchy(v14);

  }
  -[EKEventViewControllerDefaultImpl traitCollection](self, "traitCollection");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "cellForSubitemAtIndex:withTraitCollection:", v10, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  -[EKEventViewControllerDefaultImpl view](self, "view");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "window");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (v18)
  {
    -[EKEventViewControllerDefaultImpl view](self, "view");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "window");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    EKUIPopFallbackSizingContextWithViewHierarchy(v20);

  }
  if (!-[EKEventViewControllerDefaultImpl allowsSubitems](self, "allowsSubitems")
    && (objc_msgSend(v16, "accessoryType") == 1 || objc_msgSend(v16, "accessoryType") == 2)
    || objc_msgSend(v9, "tag") == 1 && !-[EKEventViewControllerDefaultImpl allowsEditing](self, "allowsEditing"))
  {
    objc_msgSend(v16, "setAccessoryType:", 0);
  }
  -[EKEventViewControllerDefaultImpl tableViewSectionContentWidth](self, "tableViewSectionContentWidth");
  v22 = v21;
  if (v21 > 10.0)
  {
    v23 = objc_msgSend(v6, "numberOfRowsInSection:", v8);
    -[EKEventViewControllerDefaultImpl view](self, "view");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "window");
    v25 = (void *)objc_claimAutoreleasedReturnValue();

    if (v25)
    {
      -[EKEventViewControllerDefaultImpl view](self, "view");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "window");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      EKUIPushFallbackSizingContextWithViewHierarchy(v27);

    }
    objc_msgSend((id)objc_opt_class(), "adjustLayoutForCell:tableViewWidth:numRowsInSection:cellRow:forceLayout:", v16, v23, v10, 1, v22);
    -[EKEventViewControllerDefaultImpl view](self, "view");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "window");
    v29 = (void *)objc_claimAutoreleasedReturnValue();

    if (v29)
    {
      -[EKEventViewControllerDefaultImpl view](self, "view");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "window");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      EKUIPopFallbackSizingContextWithViewHierarchy(v31);

    }
  }
  if (!v16)
  {
LABEL_19:
    v32 = kEKUILogHandle;
    if (os_log_type_enabled((os_log_t)kEKUILogHandle, OS_LOG_TYPE_ERROR))
    {
      v34 = 138412290;
      v35 = v7;
      _os_log_impl(&dword_1AF84D000, v32, OS_LOG_TYPE_ERROR, "No cell found from EKEventViewController for index path %@.  Using empty cell to prevent crash.", (uint8_t *)&v34, 0xCu);
    }
    v16 = (void *)objc_opt_new();
  }

  return v16;
}

- (void)tableView:(id)a3 willDisplayCell:(id)a4 forRowAtIndexPath:(id)a5
{
  NSMutableDictionary *cellHeights;
  void *v7;
  id v8;
  double v9;
  id v10;

  cellHeights = self->_cellHeights;
  v7 = (void *)MEMORY[0x1E0CB37E8];
  v8 = a5;
  objc_msgSend(a4, "frame");
  objc_msgSend(v7, "numberWithDouble:", v9);
  v10 = (id)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKey:](cellHeights, "setObject:forKey:", v10, v8);

}

- (double)tableView:(id)a3 estimatedHeightForRowAtIndexPath:(id)a4
{
  void *v4;
  void *v5;
  double v6;
  double v7;

  -[NSMutableDictionary objectForKey:](self->_cellHeights, "objectForKey:", a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
    objc_msgSend(v4, "doubleValue");
  else
    +[EKEventDetailCell detailsCellDefaultHeight](EKEventDetailCell, "detailsCellDefaultHeight");
  v7 = v6;

  return v7;
}

- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4
{
  id v6;
  id v7;
  double v8;
  double v9;
  void *v10;
  uint64_t v11;
  double v12;
  double v13;
  double v14;
  double v15;

  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "rowHeight");
  v9 = v8;
  -[EKEventViewControllerDefaultImpl _sectionAtIndex:](self, "_sectionAtIndex:", objc_msgSend(v7, "section"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    v11 = objc_msgSend(v7, "row");
    -[EKEventViewControllerDefaultImpl tableViewSectionContentWidth](self, "tableViewSectionContentWidth");
    v13 = v12;
    objc_msgSend(v6, "_backgroundInset");
    if (v13 + v14 * -2.0 > 10.0)
    {
      objc_msgSend(v10, "defaultCellHeightForSubitemAtIndex:forWidth:", v11);
      if (v15 > 0.0)
        v9 = v15;
    }
  }

  return v9;
}

- (BOOL)tableView:(id)a3 shouldHighlightRowAtIndexPath:(id)a4
{
  void *v5;
  void *v6;
  char v7;
  uint64_t v9;

  v9 = 0;
  -[EKEventViewControllerDefaultImpl _itemAtIndexPath:section:subitemIndex:](self, "_itemAtIndexPath:section:subitemIndex:", a4, 0, &v9);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    -[EKEventViewControllerDefaultImpl _ekEventViewController](self, "_ekEventViewController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v5, "eventViewController:shouldSelectSubitem:", v6, v9);

  }
  else
  {
    v7 = 1;
  }

  return v7;
}

- (void)tableView:(id)a3 didHighlightRowAtIndexPath:(id)a4
{
  void *v5;
  void *v6;
  uint64_t v7;

  v7 = 0;
  -[EKEventViewControllerDefaultImpl _itemAtIndexPath:section:subitemIndex:](self, "_itemAtIndexPath:section:subitemIndex:", a4, 0, &v7);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKEventViewControllerDefaultImpl _ekEventViewController](self, "_ekEventViewController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "eventViewController:didHighlightSubitem:", v6, v7);

}

- (void)tableView:(id)a3 didUnhighlightRowAtIndexPath:(id)a4
{
  void *v5;
  void *v6;
  uint64_t v7;

  v7 = 0;
  -[EKEventViewControllerDefaultImpl _itemAtIndexPath:section:subitemIndex:](self, "_itemAtIndexPath:section:subitemIndex:", a4, 0, &v7);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKEventViewControllerDefaultImpl _ekEventViewController](self, "_ekEventViewController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "eventViewController:didUnhighlightSubitem:", v6, v7);

}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6;
  id v7;
  EKEventDetailItem *v8;
  id v9;
  EKEventDetailItem *currentEditItem;
  BOOL v11;
  void *v12;
  _BOOL4 v13;
  void *v14;
  id WeakRetained;
  void *v16;
  id v17;
  char v18;
  id v19;
  id v20;
  uint64_t v21;

  v6 = a3;
  v7 = a4;
  v20 = 0;
  v21 = 0;
  -[EKEventViewControllerDefaultImpl _itemAtIndexPath:section:subitemIndex:](self, "_itemAtIndexPath:section:subitemIndex:", v7, &v20, &v21);
  v8 = (EKEventDetailItem *)objc_claimAutoreleasedReturnValue();
  v9 = v20;
  currentEditItem = self->_currentEditItem;
  if (currentEditItem)
    v11 = v8 == currentEditItem;
  else
    v11 = 1;
  if (v11 || -[EKEventDetailItem saveAndDismissWithForce:](currentEditItem, "saveAndDismissWithForce:", 0))
  {
    objc_msgSend(v6, "deselectRowAtIndexPath:animated:", v7, 1);
    -[EKEventViewControllerDefaultImpl _ekEventViewController](self, "_ekEventViewController");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKEventDetailItem eventViewController:didSelectReadOnlySubitem:](v8, "eventViewController:didSelectReadOnlySubitem:", v12, v21);

    v13 = -[EKEventViewControllerDefaultImpl _shouldShowEditButton](self, "_shouldShowEditButton");
    if (-[EKEventViewControllerDefaultImpl allowsSubitems](self, "allowsSubitems")
      && (!v13 || objc_msgSend(v9, "hasSubitemForIndexPathRow:", objc_msgSend(v7, "row")))
      && (objc_msgSend(v9, "tag") != 1 || -[EKEventViewControllerDefaultImpl allowsEditing](self, "allowsEditing")))
    {
      -[EKEventViewControllerDefaultImpl _ekEventViewController](self, "_ekEventViewController");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[EKEventDetailItem eventViewController:didSelectSubitem:](v8, "eventViewController:didSelectSubitem:", v14, v21);

      WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      if (WeakRetained)
      {
        v16 = WeakRetained;
        v17 = objc_loadWeakRetained((id *)&self->_delegate);
        v18 = objc_opt_respondsToSelector();

        if ((v18 & 1) != 0)
        {
          v19 = objc_loadWeakRetained((id *)&self->_delegate);
          objc_msgSend(v19, "performSelector:withObject:", sel_eventViewControllerDidReceiveEditUserInteraction_, self);

        }
      }
    }
  }
  else
  {
    objc_msgSend(v6, "selectRowAtIndexPath:animated:scrollPosition:", 0, 1, 0);
  }

}

- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4
{
  void *v4;
  void *v5;

  -[EKEventViewControllerDefaultImpl _sectionAtIndex:](self, "_sectionAtIndex:", a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "headerTitle");
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

- (void)scrollViewDidScroll:(id)a3
{
  -[EKEventViewControllerDefaultImpl updateTitleWithScrollView:animation:](self, "updateTitleWithScrollView:animation:", a3, 1);
  -[EKEventViewControllerDefaultImpl _notifyDetailItemsOfVisibilityOnScreen](self, "_notifyDetailItemsOfVisibilityOnScreen");
}

- (void)updateTitleWithScrollView:(id)a3 animation:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  double v7;
  double v8;
  void *v9;
  double v10;
  double v11;
  void *v12;
  double v13;
  void *v14;
  BOOL v15;
  double v16;
  double v17;
  double v18;
  double v19;
  void *v20;
  double v21;
  double v22;
  EKCustomTitleView *customTitle;
  EKCustomTitleView *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  EKCustomTitleView *v29;
  EKCustomTitleView *v30;
  EKCustomTitleView *v31;
  void *v32;
  void *v33;
  NSObject *v34;
  _QWORD *v35;
  EKCustomTitleView *v36;
  _QWORD v37[5];
  _QWORD block[5];
  _QWORD v39[5];

  v4 = a4;
  v6 = a3;
  if (-[UIViewController isPresentedInsidePopover](self, "isPresentedInsidePopover"))
    goto LABEL_6;
  objc_msgSend(v6, "contentSize");
  v8 = v7;
  -[EKEventViewControllerDefaultImpl view](self, "view");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "frame");
  v11 = v10;
  -[EKEventViewControllerDefaultImpl view](self, "view");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "safeAreaInsets");
  if (v8 < v11 - v13)
    goto LABEL_5;
  -[EKEventViewControllerDefaultImpl view](self, "view");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (EKUICurrentHeightSizeClassIsCompact(v14))
  {

LABEL_5:
LABEL_6:
    -[EKEventViewControllerDefaultImpl _clearCustomTitle](self, "_clearCustomTitle");
    goto LABEL_7;
  }
  v15 = -[EKEventViewControllerDefaultImpl _navigationBarShouldBeHidden](self, "_navigationBarShouldBeHidden");

  if (v15)
    goto LABEL_6;
  if (-[EKCustomTitleView animating](self->_customTitle, "animating"))
    goto LABEL_7;
  objc_msgSend(v6, "contentOffset");
  v17 = v16;
  -[EKEventTitleDetailItem titleHeight](self->_titleItem, "titleHeight");
  v19 = v18;
  -[EKEventViewControllerDefaultImpl view](self, "view");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "safeAreaInsets");
  v22 = v19 - v21;

  customTitle = self->_customTitle;
  if (v17 <= v22)
  {
    if (!customTitle)
      goto LABEL_7;
    if (v4)
    {
      -[EKCustomTitleView setAnimating:](customTitle, "setAnimating:", 1);
      v36 = self->_customTitle;
      v37[0] = MEMORY[0x1E0C809B0];
      v37[1] = 3221225472;
      v37[2] = __72__EKEventViewControllerDefaultImpl_updateTitleWithScrollView_animation___block_invoke_4;
      v37[3] = &unk_1E6018638;
      v37[4] = self;
      -[EKCustomTitleView animateOutWithCompletionBlock:](v36, "animateOutWithCompletionBlock:", v37);
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  if (customTitle)
    goto LABEL_7;
  v24 = [EKCustomTitleView alloc];
  -[EKEventViewControllerDefaultImpl viewTitle](self, "viewTitle");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKEventViewControllerDefaultImpl event](self, "event");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "title");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKEventViewControllerDefaultImpl _ekEventViewController](self, "_ekEventViewController");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = -[EKCustomTitleView initWithTitle:subTitle:eventViewController:](v24, "initWithTitle:subTitle:eventViewController:", v25, v27, v28);
  v30 = self->_customTitle;
  self->_customTitle = v29;

  v31 = self->_customTitle;
  -[EKEventViewControllerDefaultImpl navigationItem](self, "navigationItem");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "setTitleView:", v31);

  -[EKCustomTitleView window](self->_customTitle, "window");
  v33 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v33)
    goto LABEL_6;
  if (v4)
  {
    -[EKCustomTitleView setAnimating:](self->_customTitle, "setAnimating:", 1);
    v39[0] = MEMORY[0x1E0C809B0];
    v39[1] = 3221225472;
    v39[2] = __72__EKEventViewControllerDefaultImpl_updateTitleWithScrollView_animation___block_invoke;
    v39[3] = &unk_1E6018688;
    v39[4] = self;
    v34 = MEMORY[0x1E0C80D38];
    v35 = v39;
  }
  else
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __72__EKEventViewControllerDefaultImpl_updateTitleWithScrollView_animation___block_invoke_3;
    block[3] = &unk_1E6018688;
    block[4] = self;
    v34 = MEMORY[0x1E0C80D38];
    v35 = block;
  }
  dispatch_async(v34, v35);
LABEL_7:

}

uint64_t __72__EKEventViewControllerDefaultImpl_updateTitleWithScrollView_animation___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  _QWORD v7[5];

  objc_msgSend(*(id *)(a1 + 32), "navigationController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "navigationBar");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "layoutIfNeeded");

  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(void **)(v4 + 1112);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __72__EKEventViewControllerDefaultImpl_updateTitleWithScrollView_animation___block_invoke_2;
  v7[3] = &unk_1E6018638;
  v7[4] = v4;
  return objc_msgSend(v5, "animateInWithCompletionBlock:", v7);
}

uint64_t __72__EKEventViewControllerDefaultImpl_updateTitleWithScrollView_animation___block_invoke_2(uint64_t result, int a2)
{
  if (a2)
    return objc_msgSend(*(id *)(*(_QWORD *)(result + 32) + 1112), "setAnimating:", 0);
  return result;
}

uint64_t __72__EKEventViewControllerDefaultImpl_updateTitleWithScrollView_animation___block_invoke_3(uint64_t a1)
{
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1112), "setShowSubtitle:", 1);
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1112), "setNeedsLayout");
}

uint64_t __72__EKEventViewControllerDefaultImpl_updateTitleWithScrollView_animation___block_invoke_4(uint64_t result, int a2)
{
  if (a2)
    return objc_msgSend(*(id *)(result + 32), "_clearCustomTitle");
  return result;
}

- (void)_clearCustomTitle
{
  void *v3;
  void *v4;
  void *v5;
  EKCustomTitleView *customTitle;

  -[EKEventViewControllerDefaultImpl navigationItem](self, "navigationItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setTitleView:", 0);

  -[EKEventViewControllerDefaultImpl viewTitle](self, "viewTitle");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKEventViewControllerDefaultImpl _ekEventViewController](self, "_ekEventViewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setTitle:", v4);

  customTitle = self->_customTitle;
  self->_customTitle = 0;

}

+ (void)adjustLayoutForCell:(id)a3 tableViewWidth:(double)a4 numRowsInSection:(unint64_t)a5 cellRow:(unint64_t)a6 forceLayout:(BOOL)a7
{
  _BOOL4 v7;
  int v11;
  unsigned int v12;
  uint64_t v13;
  id v14;

  v7 = a7;
  v14 = a3;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    if (a5 - 1 == a6)
      v11 = 4;
    else
      v11 = 2;
    if (a6)
      v12 = v11;
    else
      v12 = 1;
    if (a5 == 1)
      v13 = 5;
    else
      v13 = v12;
    if ((objc_msgSend(v14, "needsLayoutForWidth:position:", v13, a4) & 1) != 0 || v7)
      objc_msgSend(v14, "layoutForWidth:position:", v13, a4);
  }

}

- (BOOL)allowContextProvider:(id)a3
{
  return 1;
}

- (id)getCurrentContext
{
  void *v3;
  uint64_t v4;
  EKEvent *event;
  BOOL v6;
  void (*v7)(EKEvent *, void *);
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = EKWeakLinkSymbol();
  CreateAceEventFromEKEvent = v4;
  event = self->_event;
  if (event)
    v6 = v4 == 0;
  else
    v6 = 1;
  if (!v6)
  {
    v7 = (void (*)(EKEvent *, void *))v4;
    -[EKEvent eventStore](event, "eventStore");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "timeZone");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v7(event, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v10, "dictionary");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11)
      objc_msgSend(v3, "addObject:", v11);

  }
  return v3;
}

- (unint64_t)_sectionForDetailItem:(id)a3
{
  return 0;
}

- (void)detailItem:(id)a3 performActionsOnCellAtIndexPath:(id)a4 actions:(id)a5
{
  void (**v7)(id, id);
  id v8;
  void *v9;
  id v10;

  v7 = (void (**)(id, id))a5;
  v8 = a4;
  -[EKEventViewControllerDefaultImpl tableView](self, "tableView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "cellForRowAtIndexPath:", v8);
  v10 = (id)objc_claimAutoreleasedReturnValue();

  v7[2](v7, v10);
}

- (void)detailItem:(id)a3 wantsRowReload:(id)a4
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
  v7 = -[EKEventViewControllerDefaultImpl _sectionForDetailItem:](self, "_sectionForDetailItem:", a3);
  v8 = (void *)MEMORY[0x1E0CB36B0];
  v9 = objc_msgSend(v6, "row");
  v10 = objc_msgSend(v6, "section");

  objc_msgSend(v8, "indexPathForRow:inSection:", v9, v10 + v7);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKEventViewControllerDefaultImpl tableView](self, "tableView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v11;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "reloadRowsAtIndexPaths:withRowAnimation:", v13, 0);

}

- (void)detailItem:(id)a3 wantsRowInsertions:(id)a4 rowDeletions:(id)a5 rowReloads:(id)a6
{
  id v10;
  unint64_t v11;
  void *v12;
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  void *v19;
  void *v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t j;
  void *v26;
  void *v27;
  void *v28;
  id v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t k;
  void *v34;
  id v35;
  void *v36;
  id v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  _BYTE v50[128];
  _BYTE v51[128];
  _BYTE v52[128];
  uint64_t v53;

  v53 = *MEMORY[0x1E0C80C00];
  v10 = a4;
  v37 = a5;
  v35 = a6;
  v11 = -[EKEventViewControllerDefaultImpl _sectionForDetailItem:](self, "_sectionForDetailItem:", a3);
  -[EKEventViewControllerDefaultImpl tableView](self, "tableView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "beginUpdates");
  v36 = v10;
  if (v10)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v10, "count"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v46 = 0u;
    v47 = 0u;
    v48 = 0u;
    v49 = 0u;
    v14 = v10;
    v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v46, v52, 16);
    if (v15)
    {
      v16 = v15;
      v17 = *(_QWORD *)v47;
      do
      {
        for (i = 0; i != v16; ++i)
        {
          if (*(_QWORD *)v47 != v17)
            objc_enumerationMutation(v14);
          objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForRow:inSection:", objc_msgSend(*(id *)(*((_QWORD *)&v46 + 1) + 8 * i), "row"), objc_msgSend(*(id *)(*((_QWORD *)&v46 + 1) + 8 * i), "section") + v11);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "addObject:", v19);

        }
        v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v46, v52, 16);
      }
      while (v16);
    }

    objc_msgSend(v12, "insertRowsAtIndexPaths:withRowAnimation:", v13, 0);
  }
  if (v37)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v37, "count"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v42 = 0u;
    v43 = 0u;
    v44 = 0u;
    v45 = 0u;
    v21 = v37;
    v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v42, v51, 16);
    if (v22)
    {
      v23 = v22;
      v24 = *(_QWORD *)v43;
      do
      {
        for (j = 0; j != v23; ++j)
        {
          if (*(_QWORD *)v43 != v24)
            objc_enumerationMutation(v21);
          objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForRow:inSection:", objc_msgSend(*(id *)(*((_QWORD *)&v42 + 1) + 8 * j), "row"), objc_msgSend(*(id *)(*((_QWORD *)&v42 + 1) + 8 * j), "section") + v11);
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "addObject:", v26);

        }
        v23 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v42, v51, 16);
      }
      while (v23);
    }

    objc_msgSend(v12, "deleteRowsAtIndexPaths:withRowAnimation:", v20, 0);
  }
  v27 = v35;
  if (v35)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v35, "count"));
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v38 = 0u;
    v39 = 0u;
    v40 = 0u;
    v41 = 0u;
    v29 = v35;
    v30 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v38, v50, 16);
    if (v30)
    {
      v31 = v30;
      v32 = *(_QWORD *)v39;
      do
      {
        for (k = 0; k != v31; ++k)
        {
          if (*(_QWORD *)v39 != v32)
            objc_enumerationMutation(v29);
          objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForRow:inSection:", objc_msgSend(*(id *)(*((_QWORD *)&v38 + 1) + 8 * k), "row"), objc_msgSend(*(id *)(*((_QWORD *)&v38 + 1) + 8 * k), "section") + v11);
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v28, "addObject:", v34);

        }
        v31 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v38, v50, 16);
      }
      while (v31);
    }

    objc_msgSend(v12, "reloadRowsAtIndexPaths:withRowAnimation:", v28, 0);
    v27 = v35;
  }
  objc_msgSend(v12, "endUpdates");

}

- (void)detailItem:(id)a3 wantsIndexPathsScrolledToVisible:(id)a4
{
  id v6;
  unint64_t v7;
  double y;
  double x;
  double width;
  double height;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  double v19;
  CGFloat v20;
  double v21;
  CGFloat v22;
  double v23;
  CGFloat v24;
  double v25;
  CGFloat v26;
  void *v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  uint64_t v33;
  CGRect v34;
  CGRect v35;
  CGRect v36;
  CGRect v37;
  CGRect v38;

  v33 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v7 = -[EKEventViewControllerDefaultImpl _sectionForDetailItem:](self, "_sectionForDetailItem:", a3);
  x = *MEMORY[0x1E0C9D648];
  y = *(double *)(MEMORY[0x1E0C9D648] + 8);
  width = *(double *)(MEMORY[0x1E0C9D648] + 16);
  height = *(double *)(MEMORY[0x1E0C9D648] + 24);
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v12 = v6;
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v29;
    do
    {
      v16 = 0;
      do
      {
        if (*(_QWORD *)v29 != v15)
          objc_enumerationMutation(v12);
        objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForRow:inSection:", objc_msgSend(*(id *)(*((_QWORD *)&v28 + 1) + 8 * v16), "row", (_QWORD)v28), objc_msgSend(*(id *)(*((_QWORD *)&v28 + 1) + 8 * v16), "section") + v7);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        -[EKEventViewControllerDefaultImpl tableView](self, "tableView");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "rectForRowAtIndexPath:", v17);
        v20 = v19;
        v22 = v21;
        v24 = v23;
        v26 = v25;

        v34.origin.x = x;
        v34.origin.y = y;
        v34.size.width = width;
        v34.size.height = height;
        if (CGRectIsEmpty(v34))
        {
          height = v26;
          width = v24;
          y = v22;
          x = v20;
        }
        else
        {
          v35.origin.x = v20;
          v35.origin.y = v22;
          v35.size.width = v24;
          v35.size.height = v26;
          v38.origin.x = x;
          v38.origin.y = y;
          v38.size.width = width;
          v38.size.height = height;
          v36 = CGRectUnion(v35, v38);
          x = v36.origin.x;
          y = v36.origin.y;
          width = v36.size.width;
          height = v36.size.height;
        }

        ++v16;
      }
      while (v14 != v16);
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
    }
    while (v14);
  }

  v37.origin.x = x;
  v37.origin.y = y;
  v37.size.width = width;
  v37.size.height = height;
  if (!CGRectIsEmpty(v37))
  {
    -[EKEventViewControllerDefaultImpl tableView](self, "tableView");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "scrollRectToVisible:animated:", 1, x + -10.0, y, width, height + 20.0);

  }
}

- (BOOL)shouldShowEditButtonInline
{
  BOOL v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _BOOL4 v10;
  id WeakRetained;
  id v12;
  char v13;
  void *v14;
  char v15;
  BOOL result;
  BOOL v17;

  if (-[EKEventViewControllerDefaultImpl minimalMode](self, "minimalMode"))
  {
    v3 = 0;
  }
  else
  {
    -[EKEventViewControllerDefaultImpl navigationController](self, "navigationController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
    {
      -[EKEventViewControllerDefaultImpl navigationController](self, "navigationController");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v5, "isNavigationBarHidden") & 1) != 0)
      {
        v3 = 0;
      }
      else
      {
        -[EKEventViewControllerDefaultImpl navigationItem](self, "navigationItem");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "rightBarButtonItem");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v7, "systemItem") == 2)
        {
          v3 = 1;
        }
        else
        {
          -[EKEventViewControllerDefaultImpl navigationItem](self, "navigationItem");
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "leftBarButtonItem");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          v3 = objc_msgSend(v9, "systemItem") == 2;

        }
      }

    }
    else
    {
      v3 = 0;
    }

  }
  v10 = -[EKEventViewControllerDefaultImpl _shouldShowInlineButtonFromDelegate](self, "_shouldShowInlineButtonFromDelegate");
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (objc_msgSend(WeakRetained, "conformsToProtocol:", &unk_1EEED6910))
  {
    v12 = objc_loadWeakRetained((id *)&self->_delegate);
    v13 = objc_opt_respondsToSelector();

    if ((v13 & 1) == 0)
    {
      v15 = 0;
      if (v3)
        return 0;
      goto LABEL_20;
    }
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    -[EKEventViewControllerDefaultImpl _ekEventViewController](self, "_ekEventViewController");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(WeakRetained, "eventViewControllerShouldShowInlineEditButtonForInvitations:", v14);

  }
  else
  {
    v15 = 0;
  }

  if (v3)
    return 0;
LABEL_20:
  v17 = -[EKEventViewControllerDefaultImpl noninteractivePlatterMode](self, "noninteractivePlatterMode");
  result = 0;
  if (!v17 && v10)
    return -[EKEventViewControllerDefaultImpl _shouldShowEditButton](self, "_shouldShowEditButton") | v15;
  return result;
}

- (BOOL)_shouldShowInlineButtonFromDelegate
{
  EKEventViewDelegate **p_delegate;
  id WeakRetained;
  char v5;
  id v6;
  BOOL v7;

  p_delegate = &self->_delegate;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) == 0)
    return 1;
  v6 = objc_loadWeakRetained((id *)p_delegate);
  v7 = objc_msgSend(v6, "performSelector:withObject:", sel_eventViewControllerShouldHideInlineEditButton, self) == 0;

  return v7;
}

- (void)editButtonPressed
{
  EKEventViewDelegate **p_delegate;
  id WeakRetained;
  id v5;
  id v6;
  id v7;
  void *v8;
  int v9;
  void *v10;
  id v11;

  p_delegate = &self->_delegate;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (!objc_msgSend(WeakRetained, "conformsToProtocol:", &unk_1EEED6910))
    goto LABEL_8;
  v5 = objc_loadWeakRetained((id *)p_delegate);
  if ((objc_opt_respondsToSelector() & 1) == 0)
  {
LABEL_7:

LABEL_8:
    goto LABEL_9;
  }
  v6 = objc_loadWeakRetained((id *)p_delegate);
  if ((objc_opt_respondsToSelector() & 1) == 0)
  {

    goto LABEL_7;
  }
  v7 = objc_loadWeakRetained((id *)p_delegate);
  -[EKEventViewControllerDefaultImpl _ekEventViewController](self, "_ekEventViewController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v7, "eventViewControllerShouldHandleInlineEdit:", v8);

  if (v9)
  {
    v11 = objc_loadWeakRetained((id *)p_delegate);
    -[EKEventViewControllerDefaultImpl _ekEventViewController](self, "_ekEventViewController");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "eventViewControllerInlineEditButtonWasTapped:", v10);

    return;
  }
LABEL_9:
  -[EKEventViewControllerDefaultImpl editButtonTapped](self, "editButtonTapped");
}

- (BOOL)shouldShowNextButton
{
  EKEventViewDelegate **p_delegate;
  id WeakRetained;
  char v5;
  id v6;
  int v7;
  void *v8;
  NSNumber *cachedShowNext;
  NSNumber *v10;

  p_delegate = &self->_delegate;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) == 0)
    return 0;
  v6 = objc_loadWeakRetained((id *)p_delegate);
  v7 = objc_msgSend(v6, "eventViewControllerShouldShowNextPreviousRecurrenceButtons");

  if (!v7)
    return 0;
  if (!self->_cachedShowNext)
  {
    -[EKEvent nextOccurrence](self->_event, "nextOccurrence");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    cachedShowNext = self->_cachedShowNext;
    v10 = (NSNumber *)MEMORY[0x1E0C9AAB0];
    if (!v8)
      v10 = (NSNumber *)MEMORY[0x1E0C9AAA0];
    self->_cachedShowNext = v10;

  }
  return -[NSNumber BOOLValue](self->_cachedShowNext, "BOOLValue");
}

- (BOOL)shouldShowPreviousButton
{
  EKEventViewDelegate **p_delegate;
  id WeakRetained;
  char v5;
  id v6;
  int v7;
  void *v8;
  NSNumber *cachedShowPrevious;
  NSNumber *v10;

  p_delegate = &self->_delegate;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) == 0)
    return 0;
  v6 = objc_loadWeakRetained((id *)p_delegate);
  v7 = objc_msgSend(v6, "eventViewControllerShouldShowNextPreviousRecurrenceButtons");

  if (!v7)
    return 0;
  if (!self->_cachedShowPrevious)
  {
    -[EKEvent previousOccurrence](self->_event, "previousOccurrence");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    cachedShowPrevious = self->_cachedShowPrevious;
    v10 = (NSNumber *)MEMORY[0x1E0C9AAB0];
    if (!v8)
      v10 = (NSNumber *)MEMORY[0x1E0C9AAA0];
    self->_cachedShowPrevious = v10;

  }
  return -[NSNumber BOOLValue](self->_cachedShowPrevious, "BOOLValue");
}

- (void)nextButtonPressed
{
  EKEventViewDelegate **p_delegate;
  id v4;
  char v5;
  void *v6;
  id WeakRetained;

  p_delegate = &self->_delegate;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (objc_msgSend(WeakRetained, "conformsToProtocol:", &unk_1EEED6910))
  {
    v4 = objc_loadWeakRetained((id *)p_delegate);
    v5 = objc_opt_respondsToSelector();

    if ((v5 & 1) == 0)
      return;
    WeakRetained = objc_loadWeakRetained((id *)p_delegate);
    -[EKEventViewControllerDefaultImpl _ekEventViewController](self, "_ekEventViewController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "eventViewControllerNextButtonWasTapped:", v6);

  }
}

- (void)previousButtonPressed
{
  EKEventViewDelegate **p_delegate;
  id v4;
  char v5;
  void *v6;
  id WeakRetained;

  p_delegate = &self->_delegate;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (objc_msgSend(WeakRetained, "conformsToProtocol:", &unk_1EEED6910))
  {
    v4 = objc_loadWeakRetained((id *)p_delegate);
    v5 = objc_opt_respondsToSelector();

    if ((v5 & 1) == 0)
      return;
    WeakRetained = objc_loadWeakRetained((id *)p_delegate);
    -[EKEventViewControllerDefaultImpl _ekEventViewController](self, "_ekEventViewController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "eventViewControllerPreviousButtonWasTapped:", v6);

  }
}

- (void)uneditableButtonDetailItem:(id)a3 requestsShowEvent:(id)a4
{
  id v6;
  id WeakRetained;
  id v8;
  char v9;
  void *v10;
  id v11;

  v11 = a3;
  v6 = a4;
  if (v6)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    if (!objc_msgSend(WeakRetained, "conformsToProtocol:", &unk_1EEED6910))
    {
LABEL_5:

      goto LABEL_6;
    }
    v8 = objc_loadWeakRetained((id *)&self->_delegate);
    v9 = objc_opt_respondsToSelector();

    if ((v9 & 1) != 0)
    {
      WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      -[EKEventViewControllerDefaultImpl _ekEventViewController](self, "_ekEventViewController");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(WeakRetained, "eventViewController:requestsShowEvent:", v10, v6);

      goto LABEL_5;
    }
  }
LABEL_6:

}

- (BOOL)_canPerformEditKeyCommand
{
  return -[EKEventViewControllerDefaultImpl _shouldShowEditButton](self, "_shouldShowEditButton")
      || -[EKEventViewControllerDefaultImpl shouldShowEditButtonInline](self, "shouldShowEditButtonInline");
}

- (void)_performEditKeyCommand
{
  if (-[EKEventViewControllerDefaultImpl _canPerformEditKeyCommand](self, "_canPerformEditKeyCommand"))
    -[EKEventViewControllerDefaultImpl editButtonPressed](self, "editButtonPressed");
}

- (void)copy:(id)a3
{
  EKEventViewDelegate **p_delegate;
  id v5;
  char v6;
  id v7;
  void *v8;
  id WeakRetained;

  p_delegate = &self->_delegate;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (objc_msgSend(WeakRetained, "conformsToProtocol:", &unk_1EEED6910))
  {
    v5 = objc_loadWeakRetained((id *)p_delegate);
    v6 = objc_opt_respondsToSelector();

    if ((v6 & 1) == 0)
      return;
    v7 = objc_loadWeakRetained((id *)p_delegate);
    objc_msgSend(v7, "pasteboardManager");
    WeakRetained = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", self->_event);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "copyEvents:delegate:", v8, self);

  }
}

- (void)cut:(id)a3
{
  EKEventViewDelegate **p_delegate;
  id WeakRetained;
  char v6;
  id v7;
  void *v8;
  id v9;

  p_delegate = &self->_delegate;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    v7 = objc_loadWeakRetained((id *)p_delegate);
    objc_msgSend(v7, "pasteboardManager");
    v9 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", self->_event);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "cutEvents:delegate:", v8, self);

  }
}

- (BOOL)canBecomeFirstResponder
{
  return 1;
}

- (BOOL)canPerformAction:(SEL)a3 withSender:(id)a4
{
  id v6;
  unsigned __int8 v7;
  unsigned __int8 v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  objc_super v15;
  EKEvent *event;
  _QWORD v17[2];

  v17[1] = *MEMORY[0x1E0C80C00];
  v6 = a4;
  if (sel__performEditKeyCommand == a3)
  {
    v8 = -[EKEventViewControllerDefaultImpl _canPerformEditKeyCommand](self, "_canPerformEditKeyCommand");
    goto LABEL_8;
  }
  v7 = 0;
  if ((objc_msgSend(MEMORY[0x1E0D0CDD0], "declinesToPerformCutCopyPasteAction:withSender:", a3, v6) & 1) == 0
    && sel_paste_ != a3)
  {
    if (sel_copy_ == a3)
    {
      v9 = (void *)MEMORY[0x1E0D0CDD0];
      v17[0] = self->_event;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v17, 1);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = v9;
      v12 = 1;
    }
    else
    {
      if (sel_cut_ != a3)
      {
        v15.receiver = self;
        v15.super_class = (Class)EKEventViewControllerDefaultImpl;
        v8 = -[EKEventViewControllerDefaultImpl canPerformAction:withSender:](&v15, sel_canPerformAction_withSender_, a3, v6);
LABEL_8:
        v7 = v8;
        goto LABEL_12;
      }
      v13 = (void *)MEMORY[0x1E0D0CDD0];
      event = self->_event;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &event, 1);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = v13;
      v12 = 0;
    }
    v7 = objc_msgSend(v11, "allEventsValidForAction:fromEvents:", v12, v10);

  }
LABEL_12:

  return v7;
}

- (void)pasteboardManager:(id)a3 presentAlert:(id)a4
{
  id v5;
  id v6;

  v5 = a4;
  -[EKEventViewControllerDefaultImpl presentationSourceViewController](self, "presentationSourceViewController");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "presentFromSource:", v6);

}

- (void)setToolbarItems:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[EKEventViewControllerDefaultImpl _ekEventViewController](self, "_ekEventViewController");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setToolbarItems:", v4);

}

- (id)toolbarItems
{
  void *v2;
  void *v3;

  -[EKEventViewControllerDefaultImpl _ekEventViewController](self, "_ekEventViewController");
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
  -[EKEventViewControllerDefaultImpl _ekEventViewController](self, "_ekEventViewController");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setToolbarItems:animated:", v6, v4);

}

- (id)navigationItem
{
  void *v2;
  void *v3;

  -[EKEventViewControllerDefaultImpl _ekEventViewController](self, "_ekEventViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "navigationItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)navigationController
{
  void *v2;
  void *v3;

  -[EKEventViewControllerDefaultImpl _ekEventViewController](self, "_ekEventViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "navigationController");
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
    -[EKEventViewControllerDefaultImpl navigationController](self, "navigationController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return (EKUIViewControllerNavigationDelegate *)v5;
}

- (void)setNavigationDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_navigationDelegate, a3);
}

- (BOOL)eventEditViewPresented
{
  return self->_eventEditViewPresented;
}

- (void)setEventEditViewPresented:(BOOL)a3
{
  self->_eventEditViewPresented = a3;
}

- (BOOL)allowsEditing
{
  return self->_allowsEditing;
}

- (EKEventViewDelegate)delegate
{
  return (EKEventViewDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (BOOL)allowsSubitems
{
  return self->_allowsSubitems;
}

- (void)setAllowsSubitems:(BOOL)a3
{
  self->_allowsSubitems = a3;
}

- (BOOL)allowsInviteResponses
{
  return self->_allowsInviteResponses;
}

- (NSDictionary)context
{
  return self->_context;
}

- (void)setContext:(id)a3
{
  objc_storeStrong((id *)&self->_context, a3);
}

- (int)editorHideTransition
{
  return self->_editorHideTransition;
}

- (void)setEditorHideTransition:(int)a3
{
  self->_editorHideTransition = a3;
}

- (int)editorShowTransition
{
  return self->_editorShowTransition;
}

- (void)setEditorShowTransition:(int)a3
{
  self->_editorShowTransition = a3;
}

- (BOOL)isICSPreview
{
  return self->_ICSPreview;
}

- (BOOL)isLargeDayView
{
  return self->_isLargeDayView;
}

- (void)setIsLargeDayView:(BOOL)a3
{
  self->_isLargeDayView = a3;
}

- (BOOL)noninteractivePlatterMode
{
  return self->_noninteractivePlatterMode;
}

- (BOOL)showsAddToCalendarForICSPreview
{
  return self->_showsAddToCalendarForICSPreview;
}

- (BOOL)showsDelegateMessage
{
  return self->_showsDelegateMessage;
}

- (BOOL)showsDelegatorMessage
{
  return self->_showsDelegatorMessage;
}

- (BOOL)showsDeleteForICSPreview
{
  return self->_showsDeleteForICSPreview;
}

- (BOOL)showsDetectedConferenceItem
{
  return self->_showsDetectedConferenceItem;
}

- (void)setShowsDetectedConferenceItem:(BOOL)a3
{
  self->_showsDetectedConferenceItem = a3;
}

- (BOOL)showsDoneButton
{
  return self->_showsDoneButton;
}

- (BOOL)showsOutOfDateMessage
{
  return self->_showsOutOfDateMessage;
}

- (BOOL)showsUpdateCalendarForICSPreview
{
  return self->_showsUpdateCalendarForICSPreview;
}

- (BOOL)viewIsVisible
{
  return self->_viewIsVisible;
}

- (void)setViewIsVisible:(BOOL)a3
{
  self->_viewIsVisible = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_navigationDelegate);
  objc_storeStrong((id *)&self->_reminderStore, 0);
  objc_storeStrong((id *)&self->_reminder, 0);
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_strongSelf, 0);
  objc_storeStrong((id *)&self->_editViewControllerForPasteboard, 0);
  objc_storeStrong((id *)&self->_cellHeights, 0);
  objc_storeStrong((id *)&self->_presentationSourceViewController, 0);
  objc_storeStrong((id *)&self->_blankFooterView, 0);
  objc_storeStrong((id *)&self->_tableViewTopConstraints, 0);
  objc_storeStrong((id *)&self->_headerConstraints, 0);
  objc_storeStrong((id *)&self->_headerView, 0);
  objc_storeStrong((id *)&self->_currentSections, 0);
  objc_storeStrong((id *)&self->_cachedShowPrevious, 0);
  objc_storeStrong((id *)&self->_cachedShowNext, 0);
  objc_storeStrong((id *)&self->_tableView, 0);
  objc_storeStrong((id *)&self->_currentEditItem, 0);
  objc_storeStrong((id *)&self->_customTitle, 0);
  objc_storeStrong((id *)&self->_titleItem, 0);
  objc_storeStrong((id *)&self->_statusButtonsContainerView, 0);
  objc_storeStrong((id *)&self->_statusButtonsView, 0);
  objc_storeStrong((id *)&self->_recurrenceAlertController, 0);
  objc_storeStrong((id *)&self->_activeEventEditor, 0);
  objc_storeStrong((id *)&self->_selectedEditItem, 0);
  objc_storeStrong((id *)&self->_accessDeniedView, 0);
  objc_storeStrong((id *)&self->_event, 0);
  objc_storeStrong((id *)&self->_items, 0);
}

@end
