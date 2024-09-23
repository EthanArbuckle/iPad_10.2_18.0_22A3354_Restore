@implementation EKICSPreviewListController

- (EKICSPreviewListController)initWithModel:(id)a3
{
  id v5;
  EKICSPreviewListController *v6;
  EKICSPreviewListController *v7;
  id *p_model;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  objc_super v14;

  v5 = a3;
  v14.receiver = self;
  v14.super_class = (Class)EKICSPreviewListController;
  v6 = -[EKICSPreviewListController initWithNibName:bundle:](&v14, sel_initWithNibName_bundle_, 0, 0);
  v7 = v6;
  if (v6)
  {
    p_model = (id *)&v6->_model;
    objc_storeStrong((id *)&v6->_model, a3);
    objc_msgSend(*p_model, "addObserver:forKeyPath:options:context:", v7, CFSTR("importedEvents"), 0, 0);
    v9 = (void *)MEMORY[0x1E0CB3940];
    EventKitUIBundle();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "localizedStringForKey:value:table:", CFSTR("x_events_ics_title"), &stru_1E601DFA8, 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "localizedStringWithFormat:", v11, objc_msgSend(*p_model, "totalEventCount"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKICSPreviewListController setTitle:](v7, "setTitle:", v12);

    -[EKICSPreviewListController setAllowsSubitems:](v7, "setAllowsSubitems:", 1);
  }

  return v7;
}

- (void)dealloc
{
  objc_super v3;

  -[EKICSPreviewModel removeObserver:forKeyPath:](self->_model, "removeObserver:forKeyPath:", self, CFSTR("importedEvents"));
  v3.receiver = self;
  v3.super_class = (Class)EKICSPreviewListController;
  -[EKICSPreviewListController dealloc](&v3, sel_dealloc);
}

- (void)viewDidLoad
{
  void *v3;
  uint64_t v4;
  objc_class *v5;
  void *v6;
  uint64_t v7;
  objc_class *v8;
  void *v9;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)EKICSPreviewListController;
  -[EKICSPreviewListController viewDidLoad](&v10, sel_viewDidLoad);
  -[EKICSPreviewListController buildSections](self, "buildSections");
  -[EKICSPreviewListController updateImportButton](self, "updateImportButton");
  -[EKICSPreviewListController tableView](self, "tableView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setSeparatorStyle:", 0);
  objc_msgSend(v3, "setAllowsSelection:", self->_allowsSubitems);
  v4 = objc_opt_class();
  v5 = (objc_class *)objc_opt_class();
  NSStringFromClass(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "registerClass:forCellReuseIdentifier:", v4, v6);

  v7 = objc_opt_class();
  v8 = (objc_class *)objc_opt_class();
  NSStringFromClass(v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "registerClass:forCellReuseIdentifier:", v7, v9);

  objc_msgSend(v3, "registerClass:forHeaderFooterViewReuseIdentifier:", objc_opt_class(), CFSTR("PreviewListControllerHeaderReuseIdentifier"));
}

- (void)updateImportButton
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
  id v13;

  if (!self->_allowsImport || !-[EKICSPreviewModel unimportedEventCount](self->_model, "unimportedEventCount"))
  {
    -[EKICSPreviewListController navigationItem](self, "navigationItem");
    v13 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setRightBarButtonItem:", 0);
LABEL_6:

    return;
  }
  -[EKICSPreviewListController navigationItem](self, "navigationItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "rightBarButtonItem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
    -[EKICSPreviewModel importedEvents](self->_model, "importedEvents");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "count");

    if (v6)
    {
      v7 = (void *)MEMORY[0x1E0CB3940];
      EventKitUIBundle();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("Add (%@)"), &stru_1E601DFA8, 0);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[EKICSPreviewModel unimportedEventCount](self->_model, "unimportedEventCount");
      CUIKLocalizedStringForInteger();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "localizedStringWithFormat:", v9, v10);
      v13 = (id)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      EventKitUIBundle();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("Add All"), &stru_1E601DFA8, 0);
      v13 = (id)objc_claimAutoreleasedReturnValue();
    }

    v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC34F0]), "initWithTitle:style:target:action:", v13, 2, self, sel_importAllPressed_);
    -[EKICSPreviewListController navigationItem](self, "navigationItem");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setRightBarButtonItem:", v11);

    goto LABEL_6;
  }
}

- (void)importAllPressed:(id)a3
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_listDelegate);
  objc_msgSend(WeakRetained, "icsPreviewListControllerDidRequestImportAll:", self);

}

- (void)setOverrideCalendarColor:(CGColor *)a3
{
  id v3;

  if (self->_overrideCalendarColor != a3)
  {
    self->_overrideCalendarColor = a3;
    -[EKICSPreviewListController tableView](self, "tableView");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "reloadData");

  }
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  void *v7;

  -[EKICSPreviewListController buildSections](self, "buildSections", a3, a4, a5, a6);
  -[EKICSPreviewListController tableView](self, "tableView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "reloadData");

  -[EKICSPreviewListController updateImportButton](self, "updateImportButton");
}

- (id)_timeZone
{
  void *v2;
  void *v3;

  -[EKICSPreviewModel eventStore](self->_model, "eventStore");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "timeZone");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)buildSections
{
  void *v3;
  void *v4;
  NSMutableArray *v5;
  NSMutableArray *sections;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  char v17;
  uint64_t v18;
  id obj;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  -[EKICSPreviewModel allEvents](self->_model, "allEvents");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  objc_msgSend(v4, "sortUsingComparator:", &__block_literal_global_15);
  v5 = (NSMutableArray *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 0);
  sections = self->_sections;
  self->_sections = v5;

  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  obj = v4;
  v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v7)
  {
    v8 = v7;
    v9 = 0;
    v10 = *(_QWORD *)v21;
    while (1)
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v21 != v10)
          objc_enumerationMutation(obj);
        v12 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * i);
        objc_msgSend(v12, "startDate");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        -[EKICSPreviewListController _timeZone](self, "_timeZone");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "dateForStartOfDayInTimeZone:", v14);
        v15 = (void *)objc_claimAutoreleasedReturnValue();

        if (v9)
        {
          objc_msgSend(v9, "date");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v17 = objc_msgSend(v15, "isEqualToDate:", v16);

          if ((v17 & 1) != 0)
            goto LABEL_11;
          +[EKPreviewSection sectionWithDate:](EKPreviewSection, "sectionWithDate:", v15);
          v18 = objc_claimAutoreleasedReturnValue();

          v9 = (void *)v18;
        }
        else
        {
          +[EKPreviewSection sectionWithDate:](EKPreviewSection, "sectionWithDate:", v15);
          v9 = (void *)objc_claimAutoreleasedReturnValue();
        }
        -[NSMutableArray addObject:](self->_sections, "addObject:", v9);
LABEL_11:
        objc_msgSend(v9, "addEvent:", v12);

      }
      v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
      if (!v8)
        goto LABEL_15;
    }
  }
  v9 = 0;
LABEL_15:

}

uint64_t __43__EKICSPreviewListController_buildSections__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;

  v4 = a2;
  v5 = a3;
  v6 = v4;
  v7 = v5;
  objc_msgSend(v6, "startDate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "startDate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v8, "compare:", v9);

  if (!v10)
  {
    if (objc_msgSend(v6, "isAllDay") && !objc_msgSend(v7, "isAllDay"))
    {
      v10 = -1;
    }
    else if ((objc_msgSend(v6, "isAllDay") & 1) != 0 || (objc_msgSend(v7, "isAllDay") & 1) == 0)
    {
      objc_msgSend(v6, "title");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "title");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v11, "compare:options:", v12, 1);

    }
    else
    {
      v10 = 1;
    }
  }

  return v10;
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return -[NSMutableArray count](self->_sections, "count", a3);
}

- (id)tableView:(id)a3 viewForHeaderInSection:(int64_t)a4
{
  NSMutableArray *sections;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v14;
  id v15;

  sections = self->_sections;
  v7 = a3;
  -[NSMutableArray objectAtIndex:](sections, "objectAtIndex:", a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "date");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKICSPreviewListController _timeZone](self, "_timeZone");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0;
  v15 = 0;
  +[EKUIListViewHeader headerWithTableView:reuseIdentifier:date:timeZone:currentYearStart:currentYearEnd:](EKUIListViewHeader, "headerWithTableView:reuseIdentifier:date:timeZone:currentYearStart:currentYearEnd:", v7, CFSTR("PreviewListControllerHeaderReuseIdentifier"), v9, v10, &v15, &v14);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = v15;
  return v11;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  void *v4;
  void *v5;
  int64_t v6;

  -[NSMutableArray objectAtIndex:](self->_sections, "objectAtIndex:", a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "events");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");

  return v6;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  CGColor *overrideCalendarColor;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  objc_class *v16;
  void *v17;
  void *v18;
  objc_class *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;

  v6 = a3;
  v7 = a4;
  -[NSMutableArray objectAtIndex:](self->_sections, "objectAtIndex:", objc_msgSend(v7, "section"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "events");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectAtIndex:", objc_msgSend(v7, "row"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  overrideCalendarColor = self->_overrideCalendarColor;
  if (overrideCalendarColor)
  {
    objc_msgSend(v10, "calendar");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setCGColor:", overrideCalendarColor);

  }
  objc_msgSend(v8, "date");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKICSPreviewListController _timeZone](self, "_timeZone");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setTimeZone:", v15);

  if (objc_msgSend(v10, "isAllDay"))
  {
    v16 = (objc_class *)objc_opt_class();
    NSStringFromClass(v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "dequeueReusableCellWithIdentifier:forIndexPath:", v17, v7);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v18, "updateWithEvent:dimmed:", v10, 0);
  }
  else
  {
    v19 = (objc_class *)objc_opt_class();
    NSStringFromClass(v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "dequeueReusableCellWithIdentifier:forIndexPath:", v20, v7);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v10, "startDate");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "endDateUnadjustedForLegacyClients");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = objc_msgSend(v14, "cal_isMultidayEventForUIWithStartDate:endDate:", v21, v22);

    objc_msgSend(v18, "updateWithEvent:isMultiday:occurrenceStartDate:dimmed:", v10, v23, v13, 0);
  }

  return v18;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  NSMutableArray *sections;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  id WeakRetained;
  void *v11;
  id v12;
  char v13;
  id v14;
  id v15;

  if (self->_allowsSubitems)
  {
    sections = self->_sections;
    v6 = a4;
    -[NSMutableArray objectAtIndex:](sections, "objectAtIndex:", objc_msgSend(v6, "section"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "events");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v6, "row");

    objc_msgSend(v8, "objectAtIndex:", v9);
    v15 = (id)objc_claimAutoreleasedReturnValue();

    if (v15)
    {
      WeakRetained = objc_loadWeakRetained((id *)&self->_listDelegate);
      if (WeakRetained)
      {
        v11 = WeakRetained;
        v12 = objc_loadWeakRetained((id *)&self->_listDelegate);
        v13 = objc_opt_respondsToSelector();

        if ((v13 & 1) != 0)
        {
          v14 = objc_loadWeakRetained((id *)&self->_listDelegate);
          objc_msgSend(v14, "icsPreviewListController:didSelectEvent:", self, v15);

        }
      }
    }

  }
}

- (BOOL)allowsImport
{
  return self->_allowsImport;
}

- (void)setAllowsImport:(BOOL)a3
{
  self->_allowsImport = a3;
}

- (BOOL)allowsSubitems
{
  return self->_allowsSubitems;
}

- (void)setAllowsSubitems:(BOOL)a3
{
  self->_allowsSubitems = a3;
}

- (EKICSPreviewListDelegate)listDelegate
{
  return (EKICSPreviewListDelegate *)objc_loadWeakRetained((id *)&self->_listDelegate);
}

- (void)setListDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_listDelegate, a3);
}

- (CGColor)overrideCalendarColor
{
  return self->_overrideCalendarColor;
}

- (BOOL)showWeekNumbers
{
  return self->_showWeekNumbers;
}

- (void)setShowWeekNumbers:(BOOL)a3
{
  self->_showWeekNumbers = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_listDelegate);
  objc_storeStrong((id *)&self->_sections, 0);
  objc_storeStrong((id *)&self->_model, 0);
}

@end
