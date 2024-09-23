@implementation EKAddHolidayCalendarEditor

- (EKAddHolidayCalendarEditor)initWithCalendar:(id)a3 eventStore:(id)a4 entityType:(unint64_t)a5 limitedToSource:(id)a6
{
  id v11;
  EKAddHolidayCalendarEditor *v12;
  void *v13;
  void *v14;
  objc_super v16;

  v11 = a6;
  v16.receiver = self;
  v16.super_class = (Class)EKAddHolidayCalendarEditor;
  v12 = -[EKAbstractCalendarEditor initWithCalendar:eventStore:entityType:limitedToSource:](&v16, sel_initWithCalendar_eventStore_entityType_limitedToSource_, a3, a4, a5, v11);
  if (v12)
  {
    EventKitUIBundle();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "localizedStringForKey:value:table:", CFSTR("Add Holiday Calendar - calendar list"), CFSTR("Add Holiday Calendar"), 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKAddHolidayCalendarEditor setTitle:](v12, "setTitle:", v14);

    objc_storeStrong((id *)&v12->_limitedToSource, a6);
    v12->_entityType = a5;
  }

  return v12;
}

- (id)editItems
{
  return 0;
}

- (id)rightButton
{
  return 0;
}

- (void)_beginLoadingHolidayCalendars
{
  _QWORD v3[5];

  -[EKAddHolidayCalendarEditor _populatedAlreadySubscribedCalendarURLs](self, "_populatedAlreadySubscribedCalendarURLs");
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __59__EKAddHolidayCalendarEditor__beginLoadingHolidayCalendars__block_invoke;
  v3[3] = &unk_1E601C510;
  v3[4] = self;
  objc_msgSend(MEMORY[0x1E0D0CE18], "fetchAvailableHolidayCalendarsWithCompletion:queue:", v3, MEMORY[0x1E0C80D38]);
}

uint64_t __59__EKAddHolidayCalendarEditor__beginLoadingHolidayCalendars__block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_holidayCalendarsLoadCompletedWithCalendarData:", a2);
}

- (void)_holidayCalendarsLoadCompletedWithCalendarData:(id)a3
{
  NSArray *v5;
  NSArray *filteredCalendarData;
  NSArray *v7;
  NSUInteger v8;
  void *v9;

  v5 = (NSArray *)a3;
  objc_storeStrong((id *)&self->_calendarData, a3);
  filteredCalendarData = self->_filteredCalendarData;
  self->_filteredCalendarData = v5;
  v7 = v5;

  v8 = -[NSArray count](self->_calendarData, "count");
  if (v8)
  {
    -[EKAddHolidayCalendarEditor tableView](self, "tableView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "reloadData");

    -[EKAddHolidayCalendarEditor _displayCalendarListScreen](self, "_displayCalendarListScreen");
  }
  else
  {
    -[EKAddHolidayCalendarEditor _holidayCalendarsLoadFailed](self, "_holidayCalendarsLoadFailed");
  }
}

- (void)_populatedAlreadySubscribedCalendarURLs
{
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  char v14;
  void *v15;
  uint64_t v16;
  void *v17;
  NSSet *alreadySubscribedCalendarURLStrings;
  NSSet *v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  -[EKAbstractCalendarEditor eventStore](self, "eventStore");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "calendarsForEntityType:", self->_entityType);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99E20], "setWithCapacity:", objc_msgSend(v4, "count"));
  v19 = (NSSet *)objc_claimAutoreleasedReturnValue();
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v5 = v4;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
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
        if (self->_limitedToSource)
        {
          objc_msgSend(*(id *)(*((_QWORD *)&v20 + 1) + 8 * i), "source");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v12 = objc_msgSend(v11, "isEqual:", self->_limitedToSource);

          if (!v12)
            continue;
          if (self->_limitedToSource)
            goto LABEL_18;
        }
        objc_msgSend(v10, "source");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(v13, "isDelegate");

        if ((v14 & 1) == 0)
        {
LABEL_18:
          if (objc_msgSend(v10, "isSubscribed"))
          {
            objc_msgSend(v10, "subcalURL");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            v16 = objc_msgSend(v15, "length");

            if (v16)
            {
              objc_msgSend(v10, "subcalURL");
              v17 = (void *)objc_claimAutoreleasedReturnValue();
              -[NSSet addObject:](v19, "addObject:", v17);

            }
          }
        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    }
    while (v7);
  }

  alreadySubscribedCalendarURLStrings = self->_alreadySubscribedCalendarURLStrings;
  self->_alreadySubscribedCalendarURLStrings = v19;

}

- (void)_displayLoadingScreen
{
  void *v3;
  void *v4;
  UIView *standbyScreen;
  void *v6;

  -[UIView superview](self->_standbyScreen, "superview");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    -[EKAddHolidayCalendarEditor view](self, "view");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addSubview:", self->_standbyScreen);

    standbyScreen = self->_standbyScreen;
    -[EKAddHolidayCalendarEditor view](self, "view");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "bounds");
    -[UIView setFrame:](standbyScreen, "setFrame:");

  }
  -[UILabel setHidden:](self->_standbyMessageLabel, "setHidden:", 1);
  -[UIActivityIndicatorView setHidden:](self->_spinner, "setHidden:", 0);
  -[UIActivityIndicatorView startAnimating](self->_spinner, "startAnimating");
}

- (void)_displayErrorScreen
{
  void *v3;
  void *v4;
  UIView *standbyScreen;
  void *v6;
  void *v7;
  void *v8;

  -[UIView superview](self->_standbyScreen, "superview");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    -[EKAddHolidayCalendarEditor view](self, "view");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addSubview:", self->_standbyScreen);

    standbyScreen = self->_standbyScreen;
    -[EKAddHolidayCalendarEditor view](self, "view");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "bounds");
    -[UIView setFrame:](standbyScreen, "setFrame:");

  }
  EventKitUIBundle();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("Unable to load available holiday calendars"), &stru_1E601DFA8, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setText:](self->_standbyMessageLabel, "setText:", v8);

  -[UILabel sizeToFit](self->_standbyMessageLabel, "sizeToFit");
  -[UILabel setHidden:](self->_standbyMessageLabel, "setHidden:", 0);
  -[UIActivityIndicatorView setHidden:](self->_spinner, "setHidden:", 1);
  -[UIActivityIndicatorView stopAnimating](self->_spinner, "stopAnimating");
}

- (void)_displayCalendarListScreen
{
  -[UIActivityIndicatorView setHidden:](self->_spinner, "setHidden:", 1);
  -[UIActivityIndicatorView stopAnimating](self->_spinner, "stopAnimating");
  -[UIView removeFromSuperview](self->_standbyScreen, "removeFromSuperview");
  -[EKAbstractCalendarEditor updatePreferredContentSize](self, "updatePreferredContentSize");
}

- (void)viewDidLoad
{
  id v3;
  void *v4;
  UIView *v5;
  UIView *standbyScreen;
  void *v7;
  UILabel *v8;
  UILabel *standbyMessageLabel;
  void *v10;
  UIActivityIndicatorView *v11;
  UIActivityIndicatorView *spinner;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  double v22;
  void *v23;
  void *v24;
  UISearchController *v25;
  UISearchController *searchController;
  void *v27;
  UISearchController *v28;
  void *v29;
  void *v30;
  objc_super v31;

  v31.receiver = self;
  v31.super_class = (Class)EKAddHolidayCalendarEditor;
  -[EKAbstractCalendarEditor viewDidLoad](&v31, sel_viewDidLoad);
  v3 = objc_alloc(MEMORY[0x1E0DC3F10]);
  -[EKAddHolidayCalendarEditor view](self, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bounds");
  v5 = (UIView *)objc_msgSend(v3, "initWithFrame:");
  standbyScreen = self->_standbyScreen;
  self->_standbyScreen = v5;

  objc_msgSend(MEMORY[0x1E0DC3658], "systemGroupedBackgroundColor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView setBackgroundColor:](self->_standbyScreen, "setBackgroundColor:", v7);

  -[UIView setAutoresizingMask:](self->_standbyScreen, "setAutoresizingMask:", 18);
  v8 = (UILabel *)objc_alloc_init(MEMORY[0x1E0DC3990]);
  standbyMessageLabel = self->_standbyMessageLabel;
  self->_standbyMessageLabel = v8;

  objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setTextColor:](self->_standbyMessageLabel, "setTextColor:", v10);

  -[UILabel setTextAlignment:](self->_standbyMessageLabel, "setTextAlignment:", 1);
  -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](self->_standbyMessageLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[UILabel setNumberOfLines:](self->_standbyMessageLabel, "setNumberOfLines:", 0);
  -[UILabel setHidden:](self->_standbyMessageLabel, "setHidden:", 1);
  -[UIView addSubview:](self->_standbyScreen, "addSubview:", self->_standbyMessageLabel);
  v11 = (UIActivityIndicatorView *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3438]), "initWithActivityIndicatorStyle:", 101);
  spinner = self->_spinner;
  self->_spinner = v11;

  objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIActivityIndicatorView setColor:](self->_spinner, "setColor:", v13);

  -[UIActivityIndicatorView setTranslatesAutoresizingMaskIntoConstraints:](self->_spinner, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[UIActivityIndicatorView sizeToFit](self->_spinner, "sizeToFit");
  -[UIView addSubview:](self->_standbyScreen, "addSubview:", self->_spinner);
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3718], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", self->_standbyMessageLabel, 9, 0, self->_standbyScreen, 9, 1.0, 0.0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "addObject:", v15);

  objc_msgSend(MEMORY[0x1E0CB3718], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", self->_standbyMessageLabel, 11, 0, self->_standbyScreen, 10, 1.0, 0.0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "addObject:", v16);

  objc_msgSend(MEMORY[0x1E0CB3718], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", self->_standbyMessageLabel, 5, 1, self->_standbyScreen, 17, 1.0, 0.0);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "addObject:", v17);

  objc_msgSend(MEMORY[0x1E0CB3718], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", self->_standbyMessageLabel, 6, -1, self->_standbyScreen, 18, 1.0, 0.0);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "addObject:", v18);

  objc_msgSend(MEMORY[0x1E0CB3718], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", self->_spinner, 9, 0, self->_standbyScreen, 9, 1.0, 0.0);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "addObject:", v19);

  objc_msgSend(MEMORY[0x1E0CB3718], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", self->_spinner, 4, 0, self->_standbyScreen, 10, 1.0, 0.0);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "addObject:", v20);

  objc_msgSend(MEMORY[0x1E0CB3718], "activateConstraints:", v14);
  -[EKAddHolidayCalendarEditor tableView](self, "tableView");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "registerClass:forCellReuseIdentifier:", objc_opt_class(), CFSTR("_HolidayCalendarCellReuseIdentifier"));

  v22 = *MEMORY[0x1E0DC53D8];
  -[EKAddHolidayCalendarEditor tableView](self, "tableView");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "setEstimatedRowHeight:", v22);

  -[EKAddHolidayCalendarEditor tableView](self, "tableView");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "setRowHeight:", v22);

  -[EKAddHolidayCalendarEditor _displayLoadingScreen](self, "_displayLoadingScreen");
  -[EKAddHolidayCalendarEditor _beginLoadingHolidayCalendars](self, "_beginLoadingHolidayCalendars");
  v25 = (UISearchController *)objc_alloc_init(MEMORY[0x1E0DC3C40]);
  searchController = self->_searchController;
  self->_searchController = v25;

  -[UISearchController setSearchResultsUpdater:](self->_searchController, "setSearchResultsUpdater:", self);
  -[UISearchController searchBar](self->_searchController, "searchBar");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "sizeToFit");

  v28 = self->_searchController;
  -[EKAddHolidayCalendarEditor navigationItem](self, "navigationItem");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "setSearchController:", v28);

  -[EKAddHolidayCalendarEditor navigationItem](self, "navigationItem");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "setHidesSearchBarWhenScrolling:", 0);

}

- (CGSize)calculatePreferredContentSize
{
  double v2;
  double v3;
  double v4;
  objc_super v5;
  CGSize result;

  v5.receiver = self;
  v5.super_class = (Class)EKAddHolidayCalendarEditor;
  -[EKAbstractCalendarEditor calculatePreferredContentSize](&v5, sel_calculatePreferredContentSize);
  v4 = fmax(v3, 400.0);
  result.height = v4;
  result.width = v2;
  return result;
}

- (BOOL)_alreadySubscribedToCalendar:(id)a3
{
  NSSet *alreadySubscribedCalendarURLStrings;
  void *v4;
  void *v5;

  alreadySubscribedCalendarURLStrings = self->_alreadySubscribedCalendarURLStrings;
  objc_msgSend(a3, "URL");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "absoluteString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(alreadySubscribedCalendarURLStrings) = -[NSSet containsObject:](alreadySubscribedCalendarURLStrings, "containsObject:", v5);

  return (char)alreadySubscribedCalendarURLStrings;
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return -[NSArray count](self->_calendarData, "count", a3) != 0;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  return -[NSArray count](self->_filteredCalendarData, "count", a3, a4);
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  NSArray *filteredCalendarData;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;

  filteredCalendarData = self->_filteredCalendarData;
  v7 = a4;
  v8 = a3;
  -[NSArray objectAtIndex:](filteredCalendarData, "objectAtIndex:", objc_msgSend(v7, "row"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "dequeueReusableCellWithIdentifier:forIndexPath:", CFSTR("_HolidayCalendarCellReuseIdentifier"), v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[EKAddHolidayCalendarEditor _alreadySubscribedToCalendar:](self, "_alreadySubscribedToCalendar:", v9))
  {
    objc_msgSend(v10, "setAccessoryType:", 3);
    objc_msgSend(MEMORY[0x1E0DC3658], "tertiaryLabelColor");
    v13 = objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0DC3658], "tertiaryLabelColor");
    v14 = objc_claimAutoreleasedReturnValue();

    v11 = (void *)v13;
    v12 = (void *)v14;
  }
  else
  {
    objc_msgSend(v10, "setAccessoryType:", 0);
  }
  objc_msgSend(v9, "localizedDescription");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "textLabel");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setText:", v15);

  objc_msgSend(v10, "textLabel");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setTextColor:", v11);

  objc_msgSend(v10, "textLabel");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setNumberOfLines:", 0);

  objc_msgSend(v9, "descriptionInLocaleLanguage");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "detailTextLabel");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setText:", v19);

  objc_msgSend(v10, "detailTextLabel");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setTextColor:", v12);

  objc_msgSend(v10, "detailTextLabel");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setNumberOfLines:", 0);

  return v10;
}

- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4
{
  return *MEMORY[0x1E0DC53D8];
}

- (BOOL)tableView:(id)a3 shouldHighlightRowAtIndexPath:(id)a4
{
  EKAddHolidayCalendarEditor *v4;
  void *v5;

  v4 = self;
  -[NSArray objectAtIndex:](self->_filteredCalendarData, "objectAtIndex:", objc_msgSend(a4, "row", a3));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v4) = !-[EKAddHolidayCalendarEditor _alreadySubscribedToCalendar:](v4, "_alreadySubscribedToCalendar:", v5);

  return (char)v4;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  void *v5;
  void *v6;
  EKSubscribedCalendarEditor *v7;
  void *v8;
  EKSubscribedCalendarEditor *v9;
  EKSubscribedCalendarEditor *subscriptionEditor;
  EKSubscribedCalendarEditor *v11;
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
  id obj;

  -[NSArray objectAtIndex:](self->_filteredCalendarData, "objectAtIndex:", objc_msgSend(a4, "row", a3));
  obj = (id)objc_claimAutoreleasedReturnValue();
  if (!-[EKAddHolidayCalendarEditor _alreadySubscribedToCalendar:](self, "_alreadySubscribedToCalendar:"))
  {
    objc_storeStrong((id *)&self->_selectedCalendarDatum, obj);
    -[EKAddHolidayCalendarEditor navigationItem](self, "navigationItem");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "rightBarButtonItem");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setEnabled:", 1);

    v7 = [EKSubscribedCalendarEditor alloc];
    -[EKAbstractCalendarEditor eventStore](self, "eventStore");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = -[EKSubscribedCalendarEditor initWithCalendar:eventStore:entityType:limitedToSource:](v7, "initWithCalendar:eventStore:entityType:limitedToSource:", 0, v8, self->_entityType, self->_limitedToSource);

    subscriptionEditor = self->_subscriptionEditor;
    self->_subscriptionEditor = v9;
    v11 = v9;

    objc_msgSend(obj, "URL");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKSubscribedCalendarEditor setPrefillURL:](v11, "setPrefillURL:", v12);

    -[EKAbstractCalendarEditor setDelegate:](v11, "setDelegate:", self);
    EventKitUIBundle();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "localizedStringForKey:value:table:", CFSTR("Holidays (%@)"), &stru_1E601DFA8, 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    v15 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(obj, "locale");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "countryCode");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "localizedStringForCountryCode:", v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "stringWithFormat:", v14, v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    -[EKSubscribedCalendarEditor setHolidayCalendarModeWithTitle:](v11, "setHolidayCalendarModeWithTitle:", v20);
    -[EKAddHolidayCalendarEditor navigationController](self, "navigationController");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "pushViewController:animated:", v11, 1);

    EventKitUIBundle();
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "localizedStringForKey:value:table:", CFSTR("Add Holiday Calendar - calendar preview"), CFSTR("Add Holiday Calendar"), 0);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKSubscribedCalendarEditor setTitle:](v11, "setTitle:", v23);

  }
}

- (void)tableView:(id)a3 didDeselectRowAtIndexPath:(id)a4
{
  id v4;

  objc_msgSend(a3, "cellForRowAtIndexPath:", a4);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setHighlighted:", 0);

}

- (void)calendarEditor:(id)a3 didCompleteWithAction:(int)a4
{
  EKSubscribedCalendarEditor *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  _QWORD v16[4];
  _QWORD v17[5];

  v17[4] = *MEMORY[0x1E0C80C00];
  v6 = (EKSubscribedCalendarEditor *)a3;
  if (self->_subscriptionEditor == v6)
  {
    if (a4)
    {
      if ((a4 & 0xFFFFFFFD) == 1)
      {
        v16[0] = CFSTR("url");
        -[CUIKSubscribedHolidayCalendar URL](self->_selectedCalendarDatum, "URL");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "absoluteString");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v17[0] = v8;
        v16[1] = CFSTR("locale");
        -[CUIKSubscribedHolidayCalendar locale](self->_selectedCalendarDatum, "locale");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "localeIdentifier");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v17[1] = v10;
        v16[2] = CFSTR("languageCode");
        -[CUIKSubscribedHolidayCalendar languageCode](self->_selectedCalendarDatum, "languageCode");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v17[2] = v11;
        v16[3] = CFSTR("countryCode");
        -[CUIKSubscribedHolidayCalendar countryCode](self->_selectedCalendarDatum, "countryCode");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v17[3] = v12;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v17, v16, 4);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        CalAnalyticsSendEvent();

        -[EKAbstractCalendarEditor done:](self, "done:", 0);
      }
    }
    else
    {
      -[EKAddHolidayCalendarEditor navigationController](self, "navigationController");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = (id)objc_msgSend(v14, "popViewControllerAnimated:", 1);

    }
  }

}

- (void)updateSearchResultsForSearchController:(id)a3
{
  void *v4;
  void *v5;
  NSArray *v6;
  NSArray *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  int v14;
  NSArray *filteredCalendarData;
  void *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a3, "searchBar");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "text");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v5, "length"))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", -[NSArray count](self->_calendarData, "count"));
    v6 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v17 = 0u;
    v18 = 0u;
    v19 = 0u;
    v20 = 0u;
    v7 = self->_calendarData;
    v8 = -[NSArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v18;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v18 != v10)
            objc_enumerationMutation(v7);
          v12 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
          objc_msgSend(v12, "localizedDescription", (_QWORD)v17);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = objc_msgSend(v13, "localizedStandardContainsString:", v5);

          if (v14)
            -[NSArray addObject:](v6, "addObject:", v12);
        }
        v9 = -[NSArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      }
      while (v9);
    }

    filteredCalendarData = self->_filteredCalendarData;
    self->_filteredCalendarData = v6;

  }
  else
  {
    objc_storeStrong((id *)&self->_filteredCalendarData, self->_calendarData);
  }
  -[EKAddHolidayCalendarEditor tableView](self, "tableView", (_QWORD)v17);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "reloadData");

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_limitedToSource, 0);
  objc_storeStrong((id *)&self->_spinner, 0);
  objc_storeStrong((id *)&self->_standbyMessageLabel, 0);
  objc_storeStrong((id *)&self->_standbyScreen, 0);
  objc_storeStrong((id *)&self->_searchController, 0);
  objc_storeStrong((id *)&self->_subscriptionEditor, 0);
  objc_storeStrong((id *)&self->_selectedCalendarDatum, 0);
  objc_storeStrong((id *)&self->_alreadySubscribedCalendarURLStrings, 0);
  objc_storeStrong((id *)&self->_filteredCalendarData, 0);
  objc_storeStrong((id *)&self->_calendarData, 0);
}

@end
