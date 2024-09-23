@implementation EKEventTravelTimeEditViewController

- (EKEventTravelTimeEditViewController)initWithFrame:(CGRect)a3 calendarItem:(id)a4 eventStore:(id)a5
{
  double height;
  double width;
  double y;
  double x;
  id v12;
  id v13;
  EKEventTravelTimeEditViewController *v14;
  EKEventTravelTimeEditViewController *v15;
  NSString *routeEstimationErrorMessage;
  void *v17;
  id v18;
  void *v19;
  id v20;
  _QWORD v22[4];
  id v23;
  id location;
  objc_super v25;
  _QWORD v26[2];

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v26[1] = *MEMORY[0x1E0C80C00];
  v12 = a4;
  v13 = a5;
  v25.receiver = self;
  v25.super_class = (Class)EKEventTravelTimeEditViewController;
  v14 = -[EKEditItemViewController initWithFrame:](&v25, sel_initWithFrame_, x, y, width, height);
  v15 = v14;
  if (v14)
  {
    v14->_initFrame.origin.x = x;
    v14->_initFrame.origin.y = y;
    v14->_initFrame.size.width = width;
    v14->_initFrame.size.height = height;
    objc_storeStrong((id *)&v14->_eventStore, a5);
    objc_storeStrong((id *)&v15->_calendarItem, a4);
    v15->_isOriginSelectionVisible = 0;
    routeEstimationErrorMessage = v15->_routeEstimationErrorMessage;
    v15->_routeEstimationErrorMessage = 0;

    v15->_suppressErrors = 1;
    objc_msgSend((id)objc_opt_class(), "_travelTimeLocalizedString");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKEventTravelTimeEditViewController setTitle:](v15, "setTitle:", v17);

    v15->_travelTimeSelectedChoice = 7;
    v18 = -[EKEventTravelTimeEditViewController _routeEstimationControler](v15, "_routeEstimationControler");
    objc_initWeak(&location, v15);
    v26[0] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v26, 1);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v22[0] = MEMORY[0x1E0C809B0];
    v22[1] = 3221225472;
    v22[2] = __77__EKEventTravelTimeEditViewController_initWithFrame_calendarItem_eventStore___block_invoke;
    v22[3] = &unk_1E6018610;
    objc_copyWeak(&v23, &location);
    v20 = (id)-[EKEventTravelTimeEditViewController registerForTraitChanges:withHandler:](v15, "registerForTraitChanges:withHandler:", v19, v22);

    objc_destroyWeak(&v23);
    objc_destroyWeak(&location);
  }

  return v15;
}

void __77__EKEventTravelTimeEditViewController_initWithFrame_calendarItem_eventStore___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "resetBackgroundColor");

}

- (NSString)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0D0C328], "routeTypeStringForCalLocationRoutingMode:", -[EKEventTravelTimeEditViewController selectedRoutingMode](self, "selectedRoutingMode"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKEventTravelTimeEditViewController originStructuredLocation](self, "originStructuredLocation");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "title");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKEventTravelTimeEditViewController destinationStructuredLocation](self, "destinationStructuredLocation");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "title");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKEventTravelTimeEditViewController selectedTravelTime](self, "selectedTravelTime");
  CUIKDisplayStringForTravelTimeUsingShortFormat();
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ [%p] - %@ from %@ to %@, taking %@"), v4, self, v5, v7, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v11;
}

- (void)loadView
{
  UISwitch *v3;
  UISwitch *switchControl;
  id v5;
  UITableView *v6;
  UITableView *table;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)EKEventTravelTimeEditViewController;
  -[EKEventTravelTimeEditViewController loadView](&v8, sel_loadView);
  -[EKEventTravelTimeEditViewController _handleOriginLocationErrorsWithAlert:](self, "_handleOriginLocationErrorsWithAlert:", 0);
  self->_originalSelectedTravelTime = self->_selectedTravelTime;
  self->_originalSelectedRoutingMode = self->_selectedRoutingMode;
  v3 = (UISwitch *)objc_alloc_init(MEMORY[0x1E0DC3D18]);
  switchControl = self->_switchControl;
  self->_switchControl = v3;

  -[UISwitch addTarget:action:forControlEvents:](self->_switchControl, "addTarget:action:forControlEvents:", self, sel__travelTimeActivationSwitchChanged_, 4096);
  -[UISwitch setOn:animated:](self->_switchControl, "setOn:animated:", -[EKEventTravelTimeEditViewController _showingOptionsInitialState](self, "_showingOptionsInitialState"), 0);
  v5 = objc_alloc(MEMORY[0x1E0DC3D48]);
  v6 = (UITableView *)objc_msgSend(v5, "initWithFrame:style:", 2, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  table = self->_table;
  self->_table = v6;

  -[UITableView setDataSource:](self->_table, "setDataSource:", self);
  -[UITableView setDelegate:](self->_table, "setDelegate:", self);
  -[UITableView setRowHeight:](self->_table, "setRowHeight:", *MEMORY[0x1E0DC53D8]);
  -[EKEventTravelTimeEditViewController resetBackgroundColor](self, "resetBackgroundColor");
  if (EKUIUnscaledCatalyst())
  {
    -[UITableView setRowHeight:](self->_table, "setRowHeight:", EKUIUnscaledCatalystTableRowHeightDefault());
    -[UITableView setSeparatorStyle:](self->_table, "setSeparatorStyle:", 1);
  }
  -[EKEventTravelTimeEditViewController setView:](self, "setView:", self->_table);
}

- (void)resetBackgroundColor
{
  _BOOL4 v3;
  UITableView *table;
  id v5;

  v3 = -[UIViewController isPresentedInsidePopover](self, "isPresentedInsidePopover");
  table = self->_table;
  if (v3)
    objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
  else
    objc_msgSend(MEMORY[0x1E0DC3658], "systemGroupedBackgroundColor");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[UITableView setBackgroundColor:](table, "setBackgroundColor:", v5);

}

- (void)viewDidLoad
{
  double v3;
  objc_super v4;

  -[EKEventTravelTimeEditViewController selectedTravelTime](self, "selectedTravelTime");
  self->_customTravelTimeDuration = v3;
  v4.receiver = self;
  v4.super_class = (Class)EKEventTravelTimeEditViewController;
  -[EKEditItemViewController viewDidLoad](&v4, sel_viewDidLoad);
}

- (void)viewWillAppear:(BOOL)a3
{
  void *v4;
  _QWORD block[5];
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)EKEventTravelTimeEditViewController;
  -[EKEditItemViewController viewWillAppear:](&v6, sel_viewWillAppear_, a3);
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObserver:selector:name:object:", self, sel__contentCategorySizeChanged_, *MEMORY[0x1E0DC48E8], 0);
  -[EKEventTravelTimeEditViewController _updateVisibleSections](self, "_updateVisibleSections");
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __54__EKEventTravelTimeEditViewController_viewWillAppear___block_invoke;
  block[3] = &unk_1E6018688;
  block[4] = self;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

uint64_t __54__EKEventTravelTimeEditViewController_viewWillAppear___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_autoselectFromAvailableChoices");
}

- (void)viewDidAppear:(BOOL)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)EKEventTravelTimeEditViewController;
  -[EKEventTravelTimeEditViewController viewDidAppear:](&v3, sel_viewDidAppear_, a3);
}

- (void)viewWillDisappear:(BOOL)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)EKEventTravelTimeEditViewController;
  -[EKEditItemViewController viewWillDisappear:](&v5, sel_viewWillDisappear_, a3);
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeObserver:name:object:", self, *MEMORY[0x1E0DC48E8], 0);

}

- (void)viewDidLayoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)EKEventTravelTimeEditViewController;
  -[EKEventTravelTimeEditViewController viewDidLayoutSubviews](&v3, sel_viewDidLayoutSubviews);
  -[EKEventTravelTimeEditViewController _layoutShadowView](self, "_layoutShadowView");
}

- (void)_contentCategorySizeChanged:(id)a3
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __67__EKEventTravelTimeEditViewController__contentCategorySizeChanged___block_invoke;
  block[3] = &unk_1E6018688;
  block[4] = self;
  dispatch_async(MEMORY[0x1E0C80D38], block);
}

uint64_t __67__EKEventTravelTimeEditViewController__contentCategorySizeChanged___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateTableView");
}

+ (id)_travelTimeLocalizedString
{
  void *v2;
  void *v3;

  EventKitUIBundle();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("Travel Time"), &stru_1E601DFA8, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)_layoutShadowView
{
  int64_t v3;
  _BOOL4 customTimesGroupIsShowing;
  UITableView *table;
  void *v6;
  UITableView *v9;
  double x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  double v14;
  double v15;
  double v16;
  UIView *shadowView;
  double v18;
  id v19;
  UIView *v20;
  UIView *v21;
  UIView *v22;
  void *v23;
  id v24;
  CGRect v25;
  CGRect v26;

  v3 = -[EKEventTravelTimeEditViewController _numberOfEstimatedTravelTimeResultRows](self, "_numberOfEstimatedTravelTimeResultRows");
  customTimesGroupIsShowing = self->_customTimesGroupIsShowing;
  table = self->_table;
  objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForRow:inSection:", -[EKEventTravelTimeEditViewController _numberOfEstimatedTravelTimeResultRows](self, "_numberOfEstimatedTravelTimeResultRows")- 1, -[EKEventTravelTimeEditViewController _customTravelTimeSection](self, "_customTravelTimeSection"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[UITableView cellForRowAtIndexPath:](table, "cellForRowAtIndexPath:", v6);
  v24 = (id)objc_claimAutoreleasedReturnValue();

  if (!customTimesGroupIsShowing || v3 == 0 || v24 == 0)
  {
    -[UIView removeFromSuperview](self->_shadowView, "removeFromSuperview");
  }
  else
  {
    v9 = self->_table;
    objc_msgSend(v24, "bounds");
    -[UITableView convertRect:fromView:](v9, "convertRect:fromView:", v24);
    x = v25.origin.x;
    y = v25.origin.y;
    width = v25.size.width;
    height = v25.size.height;
    v14 = CGRectGetMaxY(v25) + -1.0;
    v26.origin.x = x;
    v26.origin.y = y;
    v26.size.width = width;
    v26.size.height = height;
    v15 = CGRectGetWidth(v26);
    v16 = EKUIScaleFactor();
    shadowView = self->_shadowView;
    v18 = 2.0 / v16;
    if (!shadowView)
    {
      v19 = objc_alloc(MEMORY[0x1E0DC3F10]);
      v20 = (UIView *)objc_msgSend(v19, "initWithFrame:", *MEMORY[0x1E0C9D628], *(double *)(MEMORY[0x1E0C9D628] + 8), *(double *)(MEMORY[0x1E0C9D628] + 16), *(double *)(MEMORY[0x1E0C9D628] + 24));
      v21 = self->_shadowView;
      self->_shadowView = v20;

      v22 = self->_shadowView;
      objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 0.788235294, 1.0);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIView setBackgroundColor:](v22, "setBackgroundColor:", v23);

      -[UIView setAutoresizingMask:](self->_shadowView, "setAutoresizingMask:", 2);
      shadowView = self->_shadowView;
    }
    -[UIView setFrame:](shadowView, "setFrame:", x, v14, v15, v18);
    -[UITableView addSubview:](self->_table, "addSubview:", self->_shadowView);
    -[UITableView bringSubviewToFront:](self->_table, "bringSubviewToFront:", self->_shadowView);
  }

}

- (BOOL)_shouldAutoSelectEstimatedTravelTimeOnLookupCompletion
{
  return !-[EKEventTravelTimeEditViewController _showingOptionsInitialState](self, "_showingOptionsInitialState");
}

- (BOOL)_showingOptionsInitialState
{
  return self->_originalSelectedTravelTime > 0.0;
}

- (BOOL)_showingOptions
{
  return -[UISwitch isOn](self->_switchControl, "isOn");
}

- (void)_updateVisibleSections
{
  NSIndexPath *checkedItem;
  BOOL v4;
  BOOL v5;
  uint64_t v6;
  void *v7;
  void *v8;
  char v9;
  EKTravelRouteEstimationController *routeEstimationControler;
  void *v11;
  void *v12;

  checkedItem = self->_checkedItem;
  self->_checkedItem = 0;

  v4 = -[EKEventTravelTimeEditViewController _showingOptions](self, "_showingOptions");
  self->_externallySetValueGroupIsShowing &= v4;
  self->_customTimesGroupIsShowing = v4;
  v5 = self->_estimationGroupIsShowing && v4;
  self->_estimationGroupIsShowing = v5;
  -[EKEventTravelTimeEditViewController originStructuredLocation](self, "originStructuredLocation");
  v6 = objc_claimAutoreleasedReturnValue();
  if (!v6
    || (v7 = (void *)v6,
        -[EKEventTravelTimeEditViewController originStructuredLocation](self, "originStructuredLocation"),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        v9 = objc_msgSend(v8, "isStructured"),
        v8,
        v7,
        (v9 & 1) == 0))
  {
    routeEstimationControler = self->_routeEstimationControler;
    -[EKEventTravelTimeEditViewController arrivalDate](self, "arrivalDate");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKTravelRouteEstimationController setArrivalDate:](routeEstimationControler, "setArrivalDate:", v11);

    -[EKEventTravelTimeEditViewController _routeEstimationControler](self, "_routeEstimationControler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "beginOriginLocationEstimationLookup");

  }
  -[EKEventTravelTimeEditViewController _locationsChanged](self, "_locationsChanged");
}

- (void)_autoselectFromAvailableChoices
{
  void *v3;
  uint64_t v4;
  BOOL v5;
  uint64_t v6;
  BOOL v7;
  uint64_t v8;
  uint64_t v9;
  EKEventTravelTimeEditViewController *v10;
  double v11;
  id v12;

  self->_estimatedRowIsChecked = 0;
  self->_externallySetValueGroupIsShowing = 0;
  if (!-[EKEventTravelTimeEditViewController _showingOptions](self, "_showingOptions"))
  {
    -[EKEventTravelTimeEditViewController setTravelTimeSelectedChoice:](self, "setTravelTimeSelectedChoice:", 7);
    return;
  }
  -[EKEventTravelTimeEditViewController _indexPathForSelectedTravelTime](self, "_indexPathForSelectedTravelTime");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v3;
  if (!v3)
  {
    -[EKEventTravelTimeEditViewController selectedTravelTime](self, "selectedTravelTime");
    if (v11 <= 0.0)
    {
      v10 = self;
      v9 = 2;
    }
    else
    {
      self->_externallySetValueGroupIsShowing = 1;
      v10 = self;
      v9 = 6;
    }
    goto LABEL_14;
  }
  if (!self->_estimationGroupIsShowing
    || (v4 = objc_msgSend(v3, "section"),
        v5 = v4 == -[EKEventTravelTimeEditViewController _customTravelTimeSection](self, "_customTravelTimeSection"),
        v3 = v12,
        !v5)
    || (v6 = objc_msgSend(v12, "row"),
        v7 = v6 < -[EKEventTravelTimeEditViewController _numberOfEstimatedTravelTimeResultRows](self, "_numberOfEstimatedTravelTimeResultRows"), v3 = v12, !v7))
  {
    v8 = objc_msgSend(v3, "row");
    v9 = v8
       - -[EKEventTravelTimeEditViewController _numberOfEstimatedTravelTimeResultRows](self, "_numberOfEstimatedTravelTimeResultRows");
    v10 = self;
LABEL_14:
    -[EKEventTravelTimeEditViewController setTravelTimeSelectedChoice:](v10, "setTravelTimeSelectedChoice:", v9);
    goto LABEL_15;
  }
  self->_estimatedRowIsChecked = 1;
  -[EKEventTravelTimeEditViewController setTravelTimeSelectedChoice:](self, "setTravelTimeSelectedChoice:", 6);
  -[EKEventTravelTimeEditViewController _checkItemAtIndexPath:](self, "_checkItemAtIndexPath:", v12);
LABEL_15:

}

- (void)_updateTableView
{
  if (self->_isAnimatingTableSections)
  {
    self->_pendingReloadData = 1;
  }
  else
  {
    self->_pendingReloadData = 0;
    -[UITableView reloadData](self->_table, "reloadData");
    -[EKEventTravelTimeEditViewController _layoutShadowView](self, "_layoutShadowView");
  }
}

- (void)setArrivalDate:(id)a3
{
  id v5;
  id v6;

  objc_storeStrong((id *)&self->_arrivalDate, a3);
  v5 = a3;
  -[EKEventTravelTimeEditViewController _routeEstimationControler](self, "_routeEstimationControler");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setArrivalDate:", v5);

}

- (void)setDestinationStructuredLocation:(id)a3
{
  id v5;
  id v6;

  objc_storeStrong((id *)&self->_destinationStructuredLocation, a3);
  v5 = a3;
  -[EKEventTravelTimeEditViewController _routeEstimationControler](self, "_routeEstimationControler");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setDestinationStructuredLocation:", v5);

}

- (void)setOriginStructuredLocation:(id)a3
{
  id v5;
  void *v6;

  objc_storeStrong((id *)&self->_originStructuredLocation, a3);
  v5 = a3;
  -[EKEventTravelTimeEditViewController _routeEstimationControler](self, "_routeEstimationControler");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setOriginStructuredLocation:", v5);

  -[EKEventTravelTimeEditViewController _updateTableView](self, "_updateTableView");
}

- (void)setSelectedRoutingMode:(int64_t)a3
{
  self->_selectedRoutingMode = a3;
}

- (int64_t)selectedRoutingMode
{
  return self->_selectedRoutingMode;
}

+ (id)_startingLocationLocalizedString
{
  void *v2;
  void *v3;

  EventKitUIBundle();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("Starting Location"), &stru_1E601DFA8, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)_stringForOriginLocation
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v10;
  void *v11;
  const __CFString *v12;
  const __CFString *v13;

  -[EKEventTravelTimeEditViewController originStructuredLocation](self, "originStructuredLocation");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "title");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "length");

  if (v4)
  {
    objc_msgSend(v2, "title");
    v5 = objc_claimAutoreleasedReturnValue();
LABEL_5:
    v8 = (void *)v5;
    goto LABEL_6;
  }
  objc_msgSend(v2, "address");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "length");

  if (v7)
  {
    objc_msgSend(v2, "address");
    v5 = objc_claimAutoreleasedReturnValue();
    goto LABEL_5;
  }
  EventKitUIBundle();
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v2)
  {
    v12 = CFSTR("Previous Location");
    v13 = &stru_1E601DFA8;
  }
  else
  {
    v12 = CFSTR("Travel editor no start location");
    v13 = CFSTR("None");
  }
  objc_msgSend(v10, "localizedStringForKey:value:table:", v12, v13, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_6:
  return v8;
}

- (void)_originLocationButtonWasTapped
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  EKUILocationRowModel *v7;
  void *v8;
  EKUILocationRowModel *v9;
  void *v10;
  void *v11;
  void *v12;
  EKEventTravelTimeEditViewController *v13;
  uint64_t v14;
  void *v15;
  EKEventTravelTimeEditViewController *v16;
  void *v17;
  EKLocationEditItemViewController *v18;

  v18 = -[EKLocationEditItemViewController initWithFrame:calendarItem:eventStore:]([EKLocationEditItemViewController alloc], "initWithFrame:calendarItem:eventStore:", self->_calendarItem, self->_eventStore, self->_initFrame.origin.x, self->_initFrame.origin.y, self->_initFrame.size.width, self->_initFrame.size.height);
  -[EKEditItemViewController setEditDelegate:](v18, "setEditDelegate:", self);
  objc_msgSend((id)objc_opt_class(), "_startingLocationLocalizedString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKLocationEditItemViewController setTitle:](v18, "setTitle:", v3);

  -[EKEditItemViewController setModal:](v18, "setModal:", 1);
  -[EKEditItemViewController setShowsDoneButton:](v18, "setShowsDoneButton:", 0);
  -[EKLocationEditItemViewController setSupportedSearchTypes:](v18, "setSupportedSearchTypes:", 255);
  -[EKLocationEditItemViewController setForceSingleTextField:](v18, "setForceSingleTextField:", 1);
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC34F0]), "initWithBarButtonSystemItem:target:action:", 1, v18, sel_cancel);
  -[EKLocationEditItemViewController navigationItem](v18, "navigationItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setRightBarButtonItem:", v4);

  -[EKEventTravelTimeEditViewController originStructuredLocation](self, "originStructuredLocation");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    v7 = [EKUILocationRowModel alloc];
    -[EKEventTravelTimeEditViewController originStructuredLocation](self, "originStructuredLocation");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = -[EKUILocationRowModel initWithStructuredLocation:](v7, "initWithStructuredLocation:", v8);
    -[EKLocationEditItemViewController setLocationViewModel:](v18, "setLocationViewModel:", v9);

  }
  -[EKEventTravelTimeEditViewController presentingViewController](self, "presentingViewController");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "presentedViewController");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (v11)
  {
    v13 = v11;
  }
  else
  {
    -[EKEventTravelTimeEditViewController presentingViewController](self, "presentingViewController");
    v14 = objc_claimAutoreleasedReturnValue();
    v15 = (void *)v14;
    if (v14)
      v16 = (EKEventTravelTimeEditViewController *)v14;
    else
      v16 = self;
    v13 = v16;

  }
  v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3A40]), "initWithRootViewController:", v18);
  objc_msgSend(v17, "setModalPresentationStyle:", 3);
  self->_isOriginSelectionVisible = 1;
  self->_suppressErrors = 0;
  -[EKEventTravelTimeEditViewController presentViewController:animated:completion:](v13, "presentViewController:animated:completion:", v17, 1, 0);

}

- (void)_locationsChanged
{
  void *v3;
  _BOOL8 v4;
  _QWORD block[5];

  -[EKStructuredLocation geoLocation](self->_destinationStructuredLocation, "geoLocation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3 != 0;

  -[EKEventTravelTimeEditViewController _setEstimationActive:](self, "_setEstimationActive:", v4);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __56__EKEventTravelTimeEditViewController__locationsChanged__block_invoke;
  block[3] = &unk_1E6018688;
  block[4] = self;
  dispatch_async(MEMORY[0x1E0C80D38], block);
}

uint64_t __56__EKEventTravelTimeEditViewController__locationsChanged__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateTableView");
}

- (BOOL)editItemViewControllerSave:(id)a3
{
  void *v4;
  void *v5;

  objc_msgSend(a3, "selectedLocation");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "isStructured"))
  {
    objc_msgSend(v4, "duplicate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKEventTravelTimeEditViewController setOriginStructuredLocation:](self, "setOriginStructuredLocation:", v5);

    -[EKEventTravelTimeEditViewController _handleOriginLocationErrorsWithAlert:](self, "_handleOriginLocationErrorsWithAlert:", 1);
    -[EKEventTravelTimeEditViewController _locationsChanged](self, "_locationsChanged");
  }

  return 1;
}

- (void)editItemViewController:(id)a3 didCompleteWithAction:(int)a4
{
  id v5;
  void *v6;
  void *v7;
  id v8;
  _QWORD v9[5];

  v5 = a3;
  if (objc_msgSend(v5, "modal") && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    objc_msgSend(v5, "navigationController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __84__EKEventTravelTimeEditViewController_editItemViewController_didCompleteWithAction___block_invoke;
    v9[3] = &unk_1E6018688;
    v9[4] = self;
    objc_msgSend(v6, "dismissViewControllerAnimated:completion:", 1, v9);

  }
  else
  {
    -[EKEventTravelTimeEditViewController navigationController](self, "navigationController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (id)objc_msgSend(v7, "popViewControllerAnimated:", 1);

  }
}

void __84__EKEventTravelTimeEditViewController_editItemViewController_didCompleteWithAction___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void (**v3)(_QWORD);
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v12[5];
  void (**v13)(_QWORD);
  _QWORD aBlock[5];

  v2 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __84__EKEventTravelTimeEditViewController_editItemViewController_didCompleteWithAction___block_invoke_2;
  aBlock[3] = &unk_1E6018688;
  aBlock[4] = *(_QWORD *)(a1 + 32);
  v3 = (void (**)(_QWORD))_Block_copy(aBlock);
  if (*(_BYTE *)(*(_QWORD *)(a1 + 32) + 1154))
  {
    v4 = (void *)MEMORY[0x1E0DC3450];
    objc_msgSend((id)objc_opt_class(), "_cannotProvideDirectionsLocalizedString");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    EventKitUIBundle();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("Cannot get directions to and from the same location."), &stru_1E601DFA8, 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "alertControllerWithTitle:message:preferredStyle:", v5, v7, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v9 = (void *)MEMORY[0x1E0DC3448];
    objc_msgSend((id)objc_opt_class(), "_okLocalizedString");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = v2;
    v12[1] = 3221225472;
    v12[2] = __84__EKEventTravelTimeEditViewController_editItemViewController_didCompleteWithAction___block_invoke_3;
    v12[3] = &unk_1E601B760;
    v12[4] = *(_QWORD *)(a1 + 32);
    v13 = v3;
    objc_msgSend(v9, "actionWithTitle:style:handler:", v10, 1, v12);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "addAction:", v11);
    objc_msgSend(*(id *)(a1 + 32), "presentViewController:animated:completion:", v8, 1, 0);

  }
  else
  {
    v3[2](v3);
  }

}

uint64_t __84__EKEventTravelTimeEditViewController_editItemViewController_didCompleteWithAction___block_invoke_2(uint64_t a1)
{
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 1152) = 0;
  return objc_msgSend(*(id *)(a1 + 32), "_showRouteEstimationAlert");
}

uint64_t __84__EKEventTravelTimeEditViewController_editItemViewController_didCompleteWithAction___block_invoke_3(uint64_t a1)
{
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 1154) = 0;
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (BOOL)editItemViewControllerShouldShowDetachAlert
{
  return 0;
}

- (id)editItemEventToDetach
{
  return 0;
}

- (void)routeEstimationControllerDidFinishOriginLocationLookup:(id)a3
{
  void *v4;

  objc_msgSend(a3, "evaluatedOriginLocation");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKEventTravelTimeEditViewController setOriginStructuredLocation:](self, "setOriginStructuredLocation:", v4);

  -[EKEventTravelTimeEditViewController _locationsChanged](self, "_locationsChanged");
}

+ (id)_cannotProvideDirectionsLocalizedString
{
  void *v2;
  void *v3;

  EventKitUIBundle();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("Cannot Provide Directions"), &stru_1E601DFA8, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)_handleOriginLocationErrorsWithAlert:(BOOL)a3
{
  void *v5;
  int v6;

  -[EKEventTravelTimeEditViewController originStructuredLocation](self, "originStructuredLocation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isEqualToLocation:", self->_destinationStructuredLocation);

  if (v6)
  {
    -[EKEventTravelTimeEditViewController setOriginStructuredLocation:](self, "setOriginStructuredLocation:", 0);
    self->_needsShowOriginAlert = a3;
  }
}

+ (id)_okLocalizedString
{
  void *v2;
  void *v3;

  EventKitUIBundle();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("OK"), &stru_1E601DFA8, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)_routeEstimationControler
{
  EKTravelRouteEstimationController *routeEstimationControler;
  EKTravelRouteEstimationController *v4;
  void *v5;
  EKTravelRouteEstimationController *v6;
  EKTravelRouteEstimationController *v7;

  routeEstimationControler = self->_routeEstimationControler;
  if (!routeEstimationControler)
  {
    v4 = [EKTravelRouteEstimationController alloc];
    -[EKEventTravelTimeEditViewController destinationStructuredLocation](self, "destinationStructuredLocation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = -[EKTravelRouteEstimationController initWithDestinationStructuredLocation:eventStore:](v4, "initWithDestinationStructuredLocation:eventStore:", v5, self->_eventStore);
    v7 = self->_routeEstimationControler;
    self->_routeEstimationControler = v6;

    -[EKTravelRouteEstimationController setDelegate:](self->_routeEstimationControler, "setDelegate:", self);
    routeEstimationControler = self->_routeEstimationControler;
  }
  return routeEstimationControler;
}

- (void)_showRouteEstimationAlert
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void (*v11)(uint64_t);
  void *v12;
  id v13;
  id location;

  if (self->_routeEstimationErrorMessage)
  {
    if (!self->_isOriginSelectionVisible)
    {
      v3 = (void *)MEMORY[0x1E0DC3450];
      objc_msgSend((id)objc_opt_class(), "_cannotProvideDirectionsLocalizedString");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "alertControllerWithTitle:message:preferredStyle:", v4, self->_routeEstimationErrorMessage, 1);
      v5 = (void *)objc_claimAutoreleasedReturnValue();

      objc_initWeak(&location, self);
      v6 = (void *)MEMORY[0x1E0DC3448];
      objc_msgSend((id)objc_opt_class(), "_okLocalizedString");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = MEMORY[0x1E0C809B0];
      v10 = 3221225472;
      v11 = __64__EKEventTravelTimeEditViewController__showRouteEstimationAlert__block_invoke;
      v12 = &unk_1E601A1D0;
      objc_copyWeak(&v13, &location);
      objc_msgSend(v6, "actionWithTitle:style:handler:", v7, 1, &v9);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "addAction:", v8, v9, v10, v11, v12);

      -[EKEventTravelTimeEditViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v5, 1, 0);
      objc_destroyWeak(&v13);
      objc_destroyWeak(&location);

    }
  }
}

void __64__EKEventTravelTimeEditViewController__showRouteEstimationAlert__block_invoke(uint64_t a1)
{
  _QWORD *WeakRetained;
  void *v2;
  _QWORD *v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v3 = WeakRetained;
    objc_msgSend(WeakRetained, "setOriginStructuredLocation:", 0);
    v2 = (void *)v3[143];
    v3[143] = 0;

    WeakRetained = v3;
  }

}

- (void)_setEstimationActive:(BOOL)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  BOOL v10;

  if (a3)
  {
    -[EKEventTravelTimeEditViewController _routeEstimationControler](self, "_routeEstimationControler");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKEventTravelTimeEditViewController arrivalDate](self, "arrivalDate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setArrivalDate:", v5);

    -[EKEventTravelTimeEditViewController _routeEstimationControler](self, "_routeEstimationControler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKEventTravelTimeEditViewController originStructuredLocation](self, "originStructuredLocation");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setOriginStructuredLocation:", v7);

    -[EKEventTravelTimeEditViewController originStructuredLocation](self, "originStructuredLocation");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v7) = objc_msgSend(v8, "isStructured");

    if ((_DWORD)v7)
    {
      -[EKEventTravelTimeEditViewController _routeEstimationControler](self, "_routeEstimationControler");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "beginTravelTimeEstimationLookup");

    }
    v10 = -[EKEventTravelTimeEditViewController _showingOptions](self, "_showingOptions");
  }
  else
  {
    v10 = 0;
  }
  self->_estimationGroupIsShowing = v10;
}

- (void)_travelTimeActivationSwitchChanged:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;
  EKEventTravelTimeEditViewController *v8;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __74__EKEventTravelTimeEditViewController__travelTimeActivationSwitchChanged___block_invoke;
  v6[3] = &unk_1E6018EC0;
  v7 = v4;
  v8 = self;
  v5 = v4;
  dispatch_async(MEMORY[0x1E0C80D38], v6);

}

uint64_t __74__EKEventTravelTimeEditViewController__travelTimeActivationSwitchChanged___block_invoke(uint64_t a1)
{
  if ((objc_msgSend(*(id *)(a1 + 32), "isOn") & 1) == 0)
  {
    *(_QWORD *)(*(_QWORD *)(a1 + 40) + 1184) = 0;
    *(_QWORD *)(*(_QWORD *)(a1 + 40) + 1176) = 0;
  }
  objc_msgSend(*(id *)(a1 + 40), "_updateVisibleSections");
  return objc_msgSend(*(id *)(a1 + 40), "_autoselectFromAvailableChoices");
}

- (void)routeEstimationControllerDidBeginTravelTimeLookup:(id)a3
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __89__EKEventTravelTimeEditViewController_routeEstimationControllerDidBeginTravelTimeLookup___block_invoke;
  block[3] = &unk_1E6018688;
  block[4] = self;
  dispatch_async(MEMORY[0x1E0C80D38], block);
}

uint64_t __89__EKEventTravelTimeEditViewController_routeEstimationControllerDidBeginTravelTimeLookup___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateTableView");
}

- (void)routeEstimationControllerDidFinishTravelTimeLookup:(id)a3
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __90__EKEventTravelTimeEditViewController_routeEstimationControllerDidFinishTravelTimeLookup___block_invoke;
  block[3] = &unk_1E6018688;
  block[4] = self;
  dispatch_async(MEMORY[0x1E0C80D38], block);
}

uint64_t __90__EKEventTravelTimeEditViewController_routeEstimationControllerDidFinishTravelTimeLookup___block_invoke(uint64_t a1)
{
  uint64_t result;

  objc_msgSend(*(id *)(a1 + 32), "_handleEstimationControllerTravelTimeLookupErrors");
  objc_msgSend(*(id *)(a1 + 32), "_updateTableView");
  result = objc_msgSend(*(id *)(a1 + 32), "_showingOptions");
  if ((_DWORD)result)
  {
    if (objc_msgSend(*(id *)(a1 + 32), "_shouldAutoSelectEstimatedTravelTimeOnLookupCompletion"))
      objc_msgSend(*(id *)(a1 + 32), "setTravelTimeSelectedChoiceToFirstValidEstimatedRow");
    return objc_msgSend(*(id *)(a1 + 32), "_autoselectFromAvailableChoices");
  }
  return result;
}

- (void)_handleEstimationControllerTravelTimeLookupErrors
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  -[EKEventTravelTimeEditViewController _routeEstimationControler](self, "_routeEstimationControler");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "estimatedTravelTimeRowErrorAtRowIndex:", 0);
  v6 = (id)objc_claimAutoreleasedReturnValue();

  v4 = v6;
  if (v6)
  {
    if (self->_suppressErrors)
    {
      v5 = 0;
    }
    else
    {
      -[EKEventTravelTimeEditViewController _errorStringForMapKitErrorCode:](self, "_errorStringForMapKitErrorCode:", objc_msgSend(v6, "code"));
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = v6;
    }
    if (objc_msgSend(v4, "code") != 5)
      objc_msgSend(v6, "code");
    if (v5)
    {
      objc_storeStrong((id *)&self->_routeEstimationErrorMessage, v5);
      -[EKEventTravelTimeEditViewController _showRouteEstimationAlert](self, "_showRouteEstimationAlert");
    }
    -[EKEventTravelTimeEditViewController setOriginStructuredLocation:](self, "setOriginStructuredLocation:", 0);

    v4 = v6;
  }

}

+ (id)_directionsCouldNotBeFoundLocalizedString
{
  void *v2;
  void *v3;

  EventKitUIBundle();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("Travel lookup error - directions not found"), CFSTR("Directions could not be found."), 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)_errorStringForMapKitErrorCode:(unint64_t)a3
{
  void *v3;
  void *v4;
  void *v5;
  const __CFString *v6;
  const __CFString *v7;

  switch(a3)
  {
    case 1uLL:
    case 5uLL:
      objc_msgSend((id)objc_opt_class(), "_directionsCouldNotBeFoundLocalizedString");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      return v3;
    case 2uLL:
      EventKitUIBundle();
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = v4;
      v6 = CFSTR("Travel lookup error - server failure");
      goto LABEL_7;
    case 3uLL:
      EventKitUIBundle();
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = v4;
      v6 = CFSTR("Travel lookup error - network throttled");
      goto LABEL_7;
    case 4uLL:
      EventKitUIBundle();
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = v4;
      v6 = CFSTR("Travel lookup error - place not found");
      v7 = CFSTR("Directions could not be found.");
      goto LABEL_10;
    default:
      if (a3 == 1001)
      {
        EventKitUIBundle();
        v4 = (void *)objc_claimAutoreleasedReturnValue();
        v5 = v4;
        v6 = CFSTR("Travel lookup error - server timeout");
LABEL_7:
        v7 = CFSTR("Network lost.");
      }
      else
      {
        EventKitUIBundle();
        v4 = (void *)objc_claimAutoreleasedReturnValue();
        v5 = v4;
        v6 = CFSTR("An unknown error occurred.");
        v7 = &stru_1E601DFA8;
      }
LABEL_10:
      objc_msgSend(v4, "localizedStringForKey:value:table:", v6, v7, 0);
      v3 = (void *)objc_claimAutoreleasedReturnValue();

      return v3;
  }
}

- (void)_checkItemAtIndexPath:(id)a3
{
  id v5;
  _QWORD block[5];

  v5 = a3;
  if ((-[NSIndexPath isEqual:](self->_checkedItem, "isEqual:", v5) & 1) == 0)
    objc_storeStrong((id *)&self->_checkedItem, a3);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __61__EKEventTravelTimeEditViewController__checkItemAtIndexPath___block_invoke;
  block[3] = &unk_1E6018688;
  block[4] = self;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

uint64_t __61__EKEventTravelTimeEditViewController__checkItemAtIndexPath___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateTableView");
}

- (void)setTravelTimeSelectedChoiceToFirstValidEstimatedRow
{
  void *v3;
  uint64_t v4;
  unint64_t v5;
  void *v6;
  unint64_t v7;

  -[EKEventTravelTimeEditViewController _routeEstimationControler](self, "_routeEstimationControler");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "numberOfOutputRows");

  if (v4)
  {
    v5 = 0;
    do
    {
      if (-[EKEventTravelTimeEditViewController setTravelTimeSelectedChoiceEstimatedRowAtIndex:](self, "setTravelTimeSelectedChoiceEstimatedRowAtIndex:", v5))
      {
        break;
      }
      ++v5;
      -[EKEventTravelTimeEditViewController _routeEstimationControler](self, "_routeEstimationControler");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v6, "numberOfOutputRows");

    }
    while (v5 < v7);
  }
}

- (BOOL)setTravelTimeSelectedChoiceEstimatedRowAtIndex:(unint64_t)a3
{
  void *v5;
  char v6;
  void *v7;
  void *v8;
  void *v9;

  -[EKEventTravelTimeEditViewController _routeEstimationControler](self, "_routeEstimationControler");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "estimatedTravelTimeRowHasErrorAtRowIndex:", a3);

  if ((v6 & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForRow:inSection:", a3, -[EKEventTravelTimeEditViewController _customTravelTimeSection](self, "_customTravelTimeSection"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKEventTravelTimeEditViewController _checkItemAtIndexPath:](self, "_checkItemAtIndexPath:", v7);

    -[EKEventTravelTimeEditViewController _routeEstimationControler](self, "_routeEstimationControler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "estimatedTravelTimeValueAtRowIndex:", a3);
    -[EKEventTravelTimeEditViewController setSelectedTravelTime:](self, "setSelectedTravelTime:");

    -[EKEventTravelTimeEditViewController _routeEstimationControler](self, "_routeEstimationControler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    self->_selectedRoutingMode = objc_msgSend(v9, "estimatedTravelTimeRoutingModeAtRowIndex:", a3);

  }
  return v6 ^ 1;
}

- (void)setTravelTimeSelectedChoice:(int64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  id v8;

  if (a3 == 6)
  {
    if (self->_estimatedRowIsChecked)
    {
      -[EKEventTravelTimeEditViewController _indexPathForSelectedTravelTime](self, "_indexPathForSelectedTravelTime");
      v8 = (id)objc_claimAutoreleasedReturnValue();
      -[EKEventTravelTimeEditViewController _checkItemAtIndexPath:](self, "_checkItemAtIndexPath:", v8);
      -[EKEventTravelTimeEditViewController _routeEstimationControler](self, "_routeEstimationControler");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "estimatedTravelTimeValueAtRowIndex:", objc_msgSend(v8, "row"));
      -[EKEventTravelTimeEditViewController setSelectedTravelTime:](self, "setSelectedTravelTime:");

    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForRow:inSection:", 0, -[EKEventTravelTimeEditViewController _externallySetValueTravelTimeSection](self, "_externallySetValueTravelTimeSection"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[EKEventTravelTimeEditViewController _checkItemAtIndexPath:](self, "_checkItemAtIndexPath:", v7);

      -[EKEventTravelTimeEditViewController setSelectedTravelTime:](self, "setSelectedTravelTime:", self->_customTravelTimeDuration);
    }
  }
  else
  {
    if (a3 == 7)
    {
      -[EKEventTravelTimeEditViewController setSelectedTravelTime:](self, "setSelectedTravelTime:", 0.0);
      -[EKEventTravelTimeEditViewController _checkItemAtIndexPath:](self, "_checkItemAtIndexPath:", 0);
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForRow:inSection:", -[EKEventTravelTimeEditViewController _numberOfEstimatedTravelTimeResultRows](self, "_numberOfEstimatedTravelTimeResultRows")+ a3, -[EKEventTravelTimeEditViewController _customTravelTimeSection](self, "_customTravelTimeSection"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[EKEventTravelTimeEditViewController _checkItemAtIndexPath:](self, "_checkItemAtIndexPath:", v6);

      -[EKEventTravelTimeEditViewController setSelectedTravelTime:](self, "setSelectedTravelTime:", _travelTimeDurations[a3]);
    }
    self->_selectedRoutingMode = 0;
  }
}

- (int64_t)travelTimeSelectedChoice
{
  return self->_travelTimeSelectedChoice;
}

- (id)_indexPathForSelectedTravelTime
{
  id v2;
  int64_t i;
  void *v5;
  char v6;
  void *v7;
  double v8;
  double v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  double selectedTravelTime;
  uint64_t v16;
  double v17;
  void *v18;

  if (self->_selectedTravelTime == 0.0)
  {
    v2 = 0;
  }
  else
  {
    if (self->_estimationGroupIsShowing
      && -[EKEventTravelTimeEditViewController _numberOfEstimatedTravelTimeResultRows](self, "_numberOfEstimatedTravelTimeResultRows") >= 1)
    {
      for (i = 0;
            -[EKEventTravelTimeEditViewController _numberOfEstimatedTravelTimeResultRows](self, "_numberOfEstimatedTravelTimeResultRows") > i;
            ++i)
      {
        -[EKEventTravelTimeEditViewController _routeEstimationControler](self, "_routeEstimationControler");
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        v6 = objc_msgSend(v5, "estimatedTravelTimeRowHasErrorAtRowIndex:", i);

        if ((v6 & 1) == 0)
        {
          -[EKEventTravelTimeEditViewController _routeEstimationControler](self, "_routeEstimationControler");
          v7 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "estimatedTravelTimeValueAtRowIndex:", i);
          v9 = v8;

          -[EKEventTravelTimeEditViewController _routeEstimationControler](self, "_routeEstimationControler");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          v11 = objc_msgSend(v10, "estimatedTravelTimeRoutingModeAtRowIndex:", i);

          objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForRow:inSection:", i, -[EKEventTravelTimeEditViewController _customTravelTimeSection](self, "_customTravelTimeSection"));
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v2 = v12;
          if (v11 == self->_selectedRoutingMode && v9 == self->_selectedTravelTime)
            return v2;

        }
      }
    }
    objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForRow:inSection:", 0, 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = 0;
    selectedTravelTime = self->_selectedTravelTime;
    if (selectedTravelTime == 300.0)
    {
LABEL_15:
      objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForRow:inSection:", -[EKEventTravelTimeEditViewController _numberOfEstimatedTravelTimeResultRows](self, "_numberOfEstimatedTravelTimeResultRows")+ v14, -[EKEventTravelTimeEditViewController _customTravelTimeSection](self, "_customTravelTimeSection"));
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      v2 = v18;
      v13 = v2;
    }
    else
    {
      v16 = 0;
      while (v16 != 6)
      {
        v14 = v16 + 1;
        v17 = _travelTimeDurations[++v16];
        if (v17 == selectedTravelTime)
          goto LABEL_15;
      }
      v2 = 0;
    }

  }
  return v2;
}

- (unint64_t)_toggleSwitchSection
{
  return 0;
}

- (unint64_t)_estimatedTravelTimeSection
{
  if (self->_estimationGroupIsShowing)
    return 1;
  else
    return -1;
}

- (unint64_t)_customTravelTimeSection
{
  unint64_t v2;
  unint64_t v3;

  v2 = 2;
  if (self->_estimationGroupIsShowing)
    v2 = 3;
  v3 = 1;
  if (self->_estimationGroupIsShowing)
    v3 = 2;
  if (self->_externallySetValueGroupIsShowing)
    return v2;
  else
    return v3;
}

- (unint64_t)_externallySetValueTravelTimeSection
{
  unint64_t v2;

  v2 = 1;
  if (self->_estimationGroupIsShowing)
    v2 = 2;
  if (self->_externallySetValueGroupIsShowing)
    return v2;
  else
    return -1;
}

- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4
{
  return 0;
}

- (double)tableView:(id)a3 heightForHeaderInSection:(int64_t)a4
{
  return *MEMORY[0x1E0DC53D8];
}

- (id)tableView:(id)a3 titleForFooterInSection:(int64_t)a4
{
  void *v6;
  void *v7;
  const __CFString *v8;
  void *v9;

  if (-[EKEventTravelTimeEditViewController _toggleSwitchSection](self, "_toggleSwitchSection", a3) != a4)
  {
    if (self->_estimationGroupIsShowing
      && -[EKEventTravelTimeEditViewController _estimatedTravelTimeSection](self, "_estimatedTravelTimeSection") == a4)
    {
      EventKitUIBundle();
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = v6;
      v8 = CFSTR("Select a starting location to automatically determine travel time, or select a time below.");
      goto LABEL_7;
    }
LABEL_8:
    v9 = 0;
    return v9;
  }
  if (-[UISwitch isOn](self->_switchControl, "isOn"))
    goto LABEL_8;
  EventKitUIBundle();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  v8 = CFSTR("Add travel time for this event to your calendar. Event alerts will take this time into account and your calendar will be blocked during this time.");
LABEL_7:
  objc_msgSend(v6, "localizedStringForKey:value:table:", v8, &stru_1E601DFA8, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
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

- (double)tableView:(id)a3 heightForFooterInSection:(int64_t)a4
{
  _BOOL4 v4;
  double result;

  v4 = EKUIUnscaledCatalyst();
  result = *MEMORY[0x1E0DC53D8];
  if (v4)
    return 45.0;
  return result;
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  uint64_t v3;

  v3 = 1;
  if (self->_estimationGroupIsShowing)
    v3 = 2;
  return v3 + self->_customTimesGroupIsShowing + (unint64_t)self->_externallySetValueGroupIsShowing;
}

- (int64_t)_numberOfEstimatedTravelTimeResultRows
{
  void *v2;
  int64_t v3;

  if (!self->_estimationGroupIsShowing)
    return 0;
  -[EKEventTravelTimeEditViewController _routeEstimationControler](self, "_routeEstimationControler");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "numberOfOutputRows");

  return v3;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  if (-[EKEventTravelTimeEditViewController _toggleSwitchSection](self, "_toggleSwitchSection", a3) == a4
    || self->_estimationGroupIsShowing
    && -[EKEventTravelTimeEditViewController _estimatedTravelTimeSection](self, "_estimatedTravelTimeSection") == a4
    || self->_externallySetValueGroupIsShowing
    && -[EKEventTravelTimeEditViewController _externallySetValueTravelTimeSection](self, "_externallySetValueTravelTimeSection") == a4)
  {
    return 1;
  }
  if (-[EKEventTravelTimeEditViewController _customTravelTimeSection](self, "_customTravelTimeSection") != a4)
    return 0;
  if (self->_estimationGroupIsShowing)
    return -[EKEventTravelTimeEditViewController _numberOfEstimatedTravelTimeResultRows](self, "_numberOfEstimatedTravelTimeResultRows")+ 6;
  return 6;
}

- (void)setCell:(id)a3 checked:(BOOL)a4
{
  _BOOL8 v4;
  void *v5;
  id v6;
  void *v7;
  id v8;

  v4 = a4;
  v5 = (void *)MEMORY[0x1E0DC3658];
  v6 = a3;
  objc_msgSend(v5, "labelColor");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "textLabel");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setTextColor:", v8);

  objc_msgSend(v6, "setChecked:", v4);
}

- (int64_t)_cellStyleForIndexPath:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  int64_t v7;

  v4 = a3;
  v5 = v4;
  if (self->_estimationGroupIsShowing
    && (v6 = objc_msgSend(v4, "section"),
        v6 == -[EKEventTravelTimeEditViewController _estimatedTravelTimeSection](self, "_estimatedTravelTimeSection")))
  {
    v7 = 3;
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6;
  id v7;
  int64_t v8;
  uint64_t v9;
  EKEventStandardTravelTimeCell *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  uint64_t v21;
  unint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  int v26;
  void *v27;
  EKEventStandardTravelTimeCell *v28;
  EKEventStandardTravelTimeCell *v29;

  v6 = a3;
  v7 = a4;
  v8 = -[EKEventTravelTimeEditViewController _cellStyleForIndexPath:](self, "_cellStyleForIndexPath:", v7);
  v9 = objc_msgSend(v7, "section");
  if (v9 == -[EKEventTravelTimeEditViewController _toggleSwitchSection](self, "_toggleSwitchSection"))
  {
    v10 = -[EKUITableViewCell initWithStyle:reuseIdentifier:]([EKUITableViewCell alloc], "initWithStyle:reuseIdentifier:", v8, 0);
    -[EKEventStandardTravelTimeCell setSelectionStyle:](v10, "setSelectionStyle:", 0);
    objc_msgSend((id)objc_opt_class(), "_travelTimeLocalizedString");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKEventStandardTravelTimeCell textLabel](v10, "textLabel");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setText:", v11);

    -[EKEventStandardTravelTimeCell setAccessoryView:](v10, "setAccessoryView:", self->_switchControl);
    goto LABEL_19;
  }
  if (self->_estimationGroupIsShowing)
  {
    v13 = objc_msgSend(v7, "section");
    if (v13 == -[EKEventTravelTimeEditViewController _estimatedTravelTimeSection](self, "_estimatedTravelTimeSection"))
    {
      v10 = -[EKUITableViewCell initWithStyle:reuseIdentifier:]([EKUITableViewCell alloc], "initWithStyle:reuseIdentifier:", v8, 0);
      objc_msgSend((id)objc_opt_class(), "_startingLocationLocalizedString");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[EKEventStandardTravelTimeCell textLabel](v10, "textLabel");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "setText:", v14);

      -[EKEventTravelTimeEditViewController _stringForOriginLocation](self, "_stringForOriginLocation");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[EKEventStandardTravelTimeCell detailTextLabel](v10, "detailTextLabel");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "setText:", v16);

      -[EKCalendarChooserCell setAccessoryType:](v10, "setAccessoryType:", 1);
      goto LABEL_19;
    }
  }
  if (self->_externallySetValueGroupIsShowing
    && (v18 = objc_msgSend(v7, "section"),
        v18 == -[EKEventTravelTimeEditViewController _externallySetValueTravelTimeSection](self, "_externallySetValueTravelTimeSection")))
  {
    v10 = -[EKCalendarChooserCell initWithStyle:reuseIdentifier:]([EKEventStandardTravelTimeCell alloc], "initWithStyle:reuseIdentifier:", v8, 0);
    CUIKDisplayStringForTravelTimeUsingShortFormat();
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKEventStandardTravelTimeCell textLabel](v10, "textLabel");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setText:", v19);

  }
  else
  {
    if (!self->_customTimesGroupIsShowing
      || (v21 = objc_msgSend(v7, "section"),
          v21 != -[EKEventTravelTimeEditViewController _customTravelTimeSection](self, "_customTravelTimeSection")))
    {
      v10 = 0;
      goto LABEL_19;
    }
    v22 = -[EKEventTravelTimeEditViewController _numberOfEstimatedTravelTimeResultRows](self, "_numberOfEstimatedTravelTimeResultRows");
    if (self->_estimationGroupIsShowing && objc_msgSend(v7, "row") < v22)
    {
      -[EKEventTravelTimeEditViewController _routeEstimationControler](self, "_routeEstimationControler");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "estimatedTravelTimeTableViewCellWithRowIndex:tableView:", objc_msgSend(v7, "row"), v6);
      v10 = (EKEventStandardTravelTimeCell *)objc_claimAutoreleasedReturnValue();

      +[EKCalendarChooserCellLayoutManager sharedLayoutManagerForStyle:](EKCalendarChooserCellLayoutManager, "sharedLayoutManagerForStyle:", -[EKEventStandardTravelTimeCell style](v10, "style"));
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      -[EKEventStandardTravelTimeCell setLayoutManager:](v10, "setLayoutManager:", v24);

      -[EKEventTravelTimeEditViewController _routeEstimationControler](self, "_routeEstimationControler");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = objc_msgSend(v25, "estimatedTravelTimeRowHasErrorAtRowIndex:", objc_msgSend(v7, "row"));

      if (v26)
      {
        -[EKEventStandardTravelTimeCell setSelectionStyle:](v10, "setSelectionStyle:", 0);
        goto LABEL_19;
      }
      goto LABEL_18;
    }
    objc_msgSend(v7, "row");
    v10 = -[EKCalendarChooserCell initWithStyle:reuseIdentifier:]([EKEventStandardTravelTimeCell alloc], "initWithStyle:reuseIdentifier:", 0, 0);
    CUIKDisplayStringForTravelTimeUsingShortFormat();
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKCalendarChooserCell setTextLabelText:](v10, "setTextLabelText:", v19);
  }

LABEL_18:
  -[EKEventTravelTimeEditViewController setCell:checked:](self, "setCell:checked:", v10, -[NSIndexPath isEqual:](self->_checkedItem, "isEqual:", v7));
LABEL_19:
  if (EKUICatalyst())
  {
    objc_msgSend(v6, "backgroundColor");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKEventStandardTravelTimeCell setBackgroundColor:](v10, "setBackgroundColor:", v27);

  }
  if (!self->_sampleSizingCell)
  {
    objc_storeStrong((id *)&self->_sampleSizingCell, v10);
    if (v10)
      goto LABEL_23;
LABEL_25:
    v28 = (EKEventStandardTravelTimeCell *)objc_opt_new();
    goto LABEL_26;
  }
  if (!v10)
    goto LABEL_25;
LABEL_23:
  v28 = v10;
LABEL_26:
  v29 = v28;

  return v29;
}

- (double)tableView:(id)a3 estimatedHeightForRowAtIndexPath:(id)a4
{
  id v6;
  id v7;
  UITableViewCell *sampleSizingCell;
  UITableViewCell *v9;
  UITableViewCell *v10;
  int64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;

  v6 = a3;
  v7 = a4;
  sampleSizingCell = self->_sampleSizingCell;
  if (sampleSizingCell)
  {
    v9 = sampleSizingCell;
  }
  else
  {
    -[EKEventTravelTimeEditViewController tableView:cellForRowAtIndexPath:](self, "tableView:cellForRowAtIndexPath:", v6, v7);
    v9 = (UITableViewCell *)objc_claimAutoreleasedReturnValue();
  }
  v10 = v9;
  v11 = -[EKEventTravelTimeEditViewController _cellStyleForIndexPath:](self, "_cellStyleForIndexPath:", v7);
  -[UITableViewCell textLabel](v10, "textLabel");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "font");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  -[UITableViewCell detailTextLabel](v10, "detailTextLabel");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "font");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v13, "_scaledValueForValue:", 46.0);
  v17 = v16;
  if (v11 == 3)
  {
    objc_msgSend(v15, "_scaledValueForValue:", 15.0);
    v17 = v17 + v18;
  }
  CalRoundToScreenScale(v17);
  v20 = v19;

  return v20;
}

- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4
{
  double result;

  objc_msgSend(a3, "rowHeight");
  return result;
}

- (id)tableView:(id)a3 willSelectRowAtIndexPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  id v15;

  v6 = a3;
  v7 = a4;
  v8 = v7;
  if (!self->_estimationGroupIsShowing)
    goto LABEL_8;
  v9 = objc_msgSend(v7, "section");
  if (v9 != -[EKEventTravelTimeEditViewController _customTravelTimeSection](self, "_customTravelTimeSection"))
    goto LABEL_8;
  v10 = objc_msgSend(v8, "row");
  if (v10 >= -[EKEventTravelTimeEditViewController _numberOfEstimatedTravelTimeResultRows](self, "_numberOfEstimatedTravelTimeResultRows"))goto LABEL_8;
  -[EKEventTravelTimeEditViewController _routeEstimationControler](self, "_routeEstimationControler");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v11, "estimatedTravelTimeRowHasErrorAtRowIndex:", objc_msgSend(v8, "row")))
  {
    -[EKEventTravelTimeEditViewController _routeEstimationControler](self, "_routeEstimationControler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "estimatedTravelTimeValueAtRowIndex:", objc_msgSend(v8, "row"));
    v14 = v13;

    if (v14 == 0.0)
      goto LABEL_7;
LABEL_8:
    v15 = v8;
    goto LABEL_9;
  }

LABEL_7:
  v15 = 0;
LABEL_9:

  return v15;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  uint64_t v5;
  BOOL v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  EKEventTravelTimeEditViewController *v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  id v14;

  v14 = a4;
  v5 = objc_msgSend(v14, "section");
  v6 = v5 == -[EKEventTravelTimeEditViewController _toggleSwitchSection](self, "_toggleSwitchSection");
  v7 = v14;
  if (!v6)
  {
    if (self->_estimationGroupIsShowing)
    {
      v8 = objc_msgSend(v14, "section");
      if (v8 == -[EKEventTravelTimeEditViewController _estimatedTravelTimeSection](self, "_estimatedTravelTimeSection"))
      {
        -[EKEventTravelTimeEditViewController _originLocationButtonWasTapped](self, "_originLocationButtonWasTapped");
LABEL_13:
        v7 = v14;
        goto LABEL_14;
      }
    }
    if (self->_externallySetValueGroupIsShowing
      && (v9 = objc_msgSend(v14, "section"),
          v9 == -[EKEventTravelTimeEditViewController _externallySetValueTravelTimeSection](self, "_externallySetValueTravelTimeSection")))
    {
      v10 = self;
      v11 = 6;
    }
    else
    {
      v12 = -[EKEventTravelTimeEditViewController _numberOfEstimatedTravelTimeResultRows](self, "_numberOfEstimatedTravelTimeResultRows");
      v13 = objc_msgSend(v14, "row");
      if (self->_estimationGroupIsShowing && objc_msgSend(v14, "row") < v12)
      {
        -[EKEventTravelTimeEditViewController setTravelTimeSelectedChoiceEstimatedRowAtIndex:](self, "setTravelTimeSelectedChoiceEstimatedRowAtIndex:", objc_msgSend(v14, "row"));
        goto LABEL_13;
      }
      v11 = v13 - v12;
      v10 = self;
    }
    -[EKEventTravelTimeEditViewController setTravelTimeSelectedChoice:](v10, "setTravelTimeSelectedChoice:", v11);
    goto LABEL_13;
  }
LABEL_14:

}

- (double)selectedTravelTime
{
  return self->_selectedTravelTime;
}

- (void)setSelectedTravelTime:(double)a3
{
  self->_selectedTravelTime = a3;
}

- (NSDate)arrivalDate
{
  return self->_arrivalDate;
}

- (EKStructuredLocation)originStructuredLocation
{
  return self->_originStructuredLocation;
}

- (EKStructuredLocation)destinationStructuredLocation
{
  return self->_destinationStructuredLocation;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_destinationStructuredLocation, 0);
  objc_storeStrong((id *)&self->_originStructuredLocation, 0);
  objc_storeStrong((id *)&self->_arrivalDate, 0);
  objc_storeStrong((id *)&self->_sampleSizingCell, 0);
  objc_storeStrong((id *)&self->_shadowView, 0);
  objc_storeStrong((id *)&self->_routeEstimationControler, 0);
  objc_storeStrong((id *)&self->_routeEstimationErrorMessage, 0);
  objc_storeStrong((id *)&self->_switchControl, 0);
  objc_storeStrong((id *)&self->_checkedItem, 0);
  objc_storeStrong((id *)&self->_table, 0);
  objc_storeStrong((id *)&self->_eventStore, 0);
  objc_storeStrong((id *)&self->_calendarItem, 0);
}

@end
