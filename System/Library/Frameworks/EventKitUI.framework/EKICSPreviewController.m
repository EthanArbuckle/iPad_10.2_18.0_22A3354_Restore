@implementation EKICSPreviewController

- (EKICSPreviewController)initWithURL:(id)a3 eventStore:(id)a4
{
  return -[EKICSPreviewController initWithURL:eventStore:options:](self, "initWithURL:eventStore:options:", a3, a4, 0);
}

- (EKICSPreviewController)initWithURL:(id)a3 eventStore:(id)a4 options:(unint64_t)a5
{
  id v8;
  void *v9;
  EKICSPreviewController *v10;

  v8 = a4;
  if (a3)
  {
    objc_msgSend(MEMORY[0x1E0C99D50], "dataWithContentsOfURL:", a3);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      self = -[EKICSPreviewController initWithData:eventStore:options:](self, "initWithData:eventStore:options:", v9, v8, a5);
      v10 = self;
    }
    else
    {
      NSLog(CFSTR("Unable to get ics data from URL."));
      v10 = 0;
    }

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("Can't pass nil URL"));
    v10 = 0;
  }

  return v10;
}

- (EKICSPreviewController)initWithData:(id)a3 eventStore:(id)a4
{
  return -[EKICSPreviewController initWithData:eventStore:options:](self, "initWithData:eventStore:options:", a3, a4, 0);
}

- (EKICSPreviewController)initWithData:(id)a3 eventStore:(id)a4 options:(unint64_t)a5
{
  id v8;
  id v9;
  EKICSPreviewController *v10;
  EKICSPreviewController *v11;
  EKEventStore **p_eventStore;
  EKICSPreviewModel *v13;
  EKICSPreviewModel *model;
  uint64_t v15;
  EKICSPreviewController *v16;
  void *v17;
  objc_super v19;

  v8 = a3;
  v9 = a4;
  v19.receiver = self;
  v19.super_class = (Class)EKICSPreviewController;
  v10 = -[EKICSPreviewController init](&v19, sel_init);
  v11 = v10;
  if (!v10)
  {
LABEL_11:
    v16 = v11;
    goto LABEL_12;
  }
  if (v8)
  {
    p_eventStore = &v10->_eventStore;
    objc_storeStrong((id *)&v10->_eventStore, a4);
    v13 = -[EKICSPreviewModel initWithICSData:eventStore:options:]([EKICSPreviewModel alloc], "initWithICSData:eventStore:options:", v8, v11->_eventStore, a5);
    model = v11->_model;
    v11->_model = v13;

    if (-[EKICSPreviewModel totalEventCount](v11->_model, "totalEventCount"))
    {
      if (*p_eventStore)
      {
        *(_WORD *)&v11->_allowsEditing = 257;
        v15 = -[EKICSPreviewModel actionsState](v11->_model, "actionsState");
      }
      else
      {
        v15 = 1;
      }
      v11->_actionsState = v15;
      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "addObserver:selector:name:object:", v11, sel__databaseChanged_, *MEMORY[0x1E0CA9F88], v11->_eventStore);

      goto LABEL_11;
    }
    NSLog(CFSTR("Import of ics file yielded no events."));
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("Can't pass nil data"));
  }
  v16 = 0;
LABEL_12:

  return v16;
}

- (EKICSPreviewController)initWithEventObjectID:(id)a3 eventStore:(id)a4
{
  id v6;
  id v7;
  EKICSPreviewController *v8;
  EKICSPreviewController *v9;
  void *v10;
  EKEvent *v11;
  EKEvent *eventFromUID;
  EKEvent *v13;
  void *v14;
  EKICSPreviewController *v15;
  NSObject *v16;
  objc_super v18;
  uint8_t buf[4];
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v18.receiver = self;
  v18.super_class = (Class)EKICSPreviewController;
  v8 = -[EKICSPreviewController init](&v18, sel_init);
  v9 = v8;
  if (!v8)
    goto LABEL_4;
  objc_storeStrong((id *)&v8->_eventStore, a4);
  objc_msgSend(MEMORY[0x1E0C99E80], "calendarTimeZone");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKEventStore setTimeZone:](v9->_eventStore, "setTimeZone:", v10);

  -[EKEventStore eventForObjectID:occurrenceDate:](v9->_eventStore, "eventForObjectID:occurrenceDate:", v6, 0);
  v11 = (EKEvent *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    eventFromUID = v9->_eventFromUID;
    v9->_eventFromUID = v11;
    v13 = v11;

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "addObserver:selector:name:object:", v9, sel__databaseChanged_, *MEMORY[0x1E0CA9F88], v9->_eventStore);

LABEL_4:
    v15 = v9;
    goto LABEL_8;
  }
  v16 = kEKUILogHandle;
  if (os_log_type_enabled((os_log_t)kEKUILogHandle, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412290;
    v20 = v6;
    _os_log_impl(&dword_1AF84D000, v16, OS_LOG_TYPE_ERROR, "EKICSPreviewController cannot be initialized with no event; Could not find event with object id: %@",
      buf,
      0xCu);
  }
  v15 = 0;
LABEL_8:

  return v15;
}

- (EKICSPreviewController)initWithEventUID:(int)a3 eventStore:(id)a4
{
  uint64_t v4;
  void *v6;
  uint64_t v7;
  id v8;
  void *v9;
  EKICSPreviewController *v10;

  v4 = *(_QWORD *)&a3;
  v6 = (void *)MEMORY[0x1E0CAA0C0];
  v7 = *MEMORY[0x1E0D0BE78];
  v8 = a4;
  objc_msgSend(v6, "objectIDWithEntityType:rowID:databaseID:", 2, v4, v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[EKICSPreviewController initWithEventObjectID:eventStore:](self, "initWithEventObjectID:eventStore:", v9, v8);

  return v10;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:name:object:", self, *MEMORY[0x1E0CA9F88], self->_eventStore);

  v4.receiver = self;
  v4.super_class = (Class)EKICSPreviewController;
  -[EKICSPreviewController dealloc](&v4, sel_dealloc);
}

- (id)singleExistingEventUniqueID
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;

  if (-[EKICSPreviewModel totalEventCount](self->_model, "totalEventCount") == 1
    && -[EKICSPreviewModel importedEventCount](self->_model, "importedEventCount") == 1)
  {
    -[EKICSPreviewModel importedEvents](self->_model, "importedEvents");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "firstObject");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    -[EKICSPreviewModel eventStore](self->_model, "eventStore");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "uniqueId");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "eventWithUniqueId:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7 && (v8 = objc_msgSend(v7, "sequenceNumber"), v8 >= (int)objc_msgSend(v4, "sequenceNumber")))
    {
      objc_msgSend(v7, "uniqueID");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v9 = 0;
    }

  }
  else
  {
    v9 = 0;
  }
  return v9;
}

- (void)addEventsToCalendar
{
  void *v3;
  NSObject *v4;
  const char *v5;
  uint8_t *v6;
  __int16 v7;
  uint8_t buf[2];

  if (!-[EKICSPreviewController allowsImport](self, "allowsImport"))
  {
    v4 = kEKUILogHandle;
    if (!os_log_type_enabled((os_log_t)kEKUILogHandle, OS_LOG_TYPE_ERROR))
      return;
    *(_WORD *)buf = 0;
    v5 = "Add to Calendar requested, but self.allowsImport isn't true";
    v6 = buf;
    goto LABEL_8;
  }
  if (self->_eventFromUID
    || (-[EKICSPreviewController singleExistingEventUniqueID](self, "singleExistingEventUniqueID"),
        v3 = (void *)objc_claimAutoreleasedReturnValue(),
        v3,
        v3))
  {
    v4 = kEKUILogHandle;
    if (!os_log_type_enabled((os_log_t)kEKUILogHandle, OS_LOG_TYPE_ERROR))
      return;
    v7 = 0;
    v5 = "Add to Calendar requested, but event already exists in the store";
    v6 = (uint8_t *)&v7;
LABEL_8:
    _os_log_impl(&dword_1AF84D000, v4, OS_LOG_TYPE_ERROR, v5, v6, 2u);
    return;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[UIViewController performAddToCalendar](self->_contentViewController, "performAddToCalendar");
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[EKICSPreviewController importAllRequested:](self, "importAllRequested:", self->_contentViewController);
  }
}

- (id)detailViewForEvent:(id)a3 eventInRealStore:(BOOL)a4 showUpdate:(BOOL)a5 showDelete:(BOOL)a6
{
  _BOOL4 v6;
  _BOOL4 v7;
  _BOOL4 v8;
  id v10;
  EKEventViewController *v11;
  _BOOL4 v12;
  unint64_t actionsState;
  void *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  void *v22;

  v6 = a6;
  v7 = a5;
  v8 = a4;
  v10 = a3;
  v11 = -[EKEventViewController initWithRemoteUI:]([EKEventViewController alloc], "initWithRemoteUI:", 0);
  -[EKEventViewController setICSPreview:](v11, "setICSPreview:", !v8);
  -[EKEventViewController setEvent:](v11, "setEvent:", v10);

  if (self->_allowsImport)
  {
    v12 = 0;
    if (!self->_actionsState && !v8)
      v12 = -[EKICSPreviewController _anyCalendarsSupportingImport](self, "_anyCalendarsSupportingImport");
  }
  else
  {
    v12 = 0;
  }
  -[EKEventViewController setShowsAddToCalendarForICSPreview:](v11, "setShowsAddToCalendarForICSPreview:", v12 && !v7);
  -[EKEventViewController setShowsUpdateCalendarForICSPreview:](v11, "setShowsUpdateCalendarForICSPreview:", v12 & v7);
  -[EKEventViewController setShowsDeleteForICSPreview:](v11, "setShowsDeleteForICSPreview:", v12 & v6);
  actionsState = self->_actionsState;
  switch(actionsState)
  {
    case 4uLL:
      -[EKEventViewController setShowsDelegateMessage:](v11, "setShowsDelegateMessage:", 1);
      break;
    case 3uLL:
      -[EKEventViewController setShowsDelegatorMessage:](v11, "setShowsDelegatorMessage:", 1);
      break;
    case 2uLL:
      -[EKEventViewController setShowsOutOfDateMessage:](v11, "setShowsOutOfDateMessage:", 1);
      break;
  }
  -[EKEventViewController setAllowsEditing:](v11, "setAllowsEditing:", 0);
  -[EKEventViewController setAllowsInviteResponses:](v11, "setAllowsInviteResponses:", 1);
  -[EKEventViewController setAllowsSubitems:](v11, "setAllowsSubitems:", self->_allowsSubitems);
  -[EKEventViewController setDelegate:](v11, "setDelegate:", self);
  -[EKEventViewController setModalInPresentation:](v11, "setModalInPresentation:", 0);
  -[EKEventViewController setShowsDoneButton:](v11, "setShowsDoneButton:", 0);
  -[EKEventViewController view](v11, "view");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "frame");
  v16 = v15;
  v18 = v17;
  v20 = v19;

  v21 = EKUIContainedControllerIdealWidth();
  -[EKEventViewController view](v11, "view");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setFrame:", v16, v18, v21, v20);

  -[EKEventViewController preferredContentSize](v11, "preferredContentSize");
  -[EKEventViewController setPreferredContentSize:](v11, "setPreferredContentSize:");
  return v11;
}

- (id)viewController
{
  EKEventViewController *v3;
  void *contentViewController;
  EKICSPreviewListController *v5;
  uint64_t v6;
  void *v7;
  double v8;
  double v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  void *v14;
  UIViewController *v15;
  EKICSPreviewListController *v16;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  UIViewController *v25;
  UIViewController *v26;

  if (!self->_contentViewController)
  {
    if (self->_eventFromUID)
    {
      v3 = -[EKEventViewController initWithRemoteUI:]([EKEventViewController alloc], "initWithRemoteUI:", 0);
      -[EKEventViewController setICSPreview:](v3, "setICSPreview:", 1);
      -[EKEventViewController setEvent:](v3, "setEvent:", self->_eventFromUID);
      -[EKEventViewController setAllowsCalendarPreview:](v3, "setAllowsCalendarPreview:", 1);
      -[EKEventViewController setAllowsEditing:](v3, "setAllowsEditing:", 1);
      -[EKEventViewController setShowsDeleteForICSPreview:](v3, "setShowsDeleteForICSPreview:", 1);
      -[EKEventViewController setDelegate:](v3, "setDelegate:", self);
      contentViewController = self->_contentViewController;
      self->_contentViewController = &v3->super;
    }
    else if (-[EKICSPreviewModel totalEventCount](self->_model, "totalEventCount") == 1
           && !self->_showListViewForOneEvent)
    {
      -[EKICSPreviewModel importedEvents](self->_model, "importedEvents");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = objc_msgSend(v18, "count");

      -[EKICSPreviewModel allEvents](self->_model, "allEvents");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "firstObject");
      contentViewController = (void *)objc_claimAutoreleasedReturnValue();

      if (objc_msgSend(contentViewController, "isPhantom"))
      {
        objc_msgSend(contentViewController, "detachedItems");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = objc_msgSend(v21, "count");

        if (v22)
        {
          objc_msgSend(contentViewController, "detachedItems");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "anyObject");
          v24 = objc_claimAutoreleasedReturnValue();

          contentViewController = (void *)v24;
        }
      }
      if (contentViewController)
      {
        -[EKICSPreviewController detailViewForEvent:eventInRealStore:showUpdate:showDelete:](self, "detailViewForEvent:eventInRealStore:showUpdate:showDelete:", contentViewController, v19 == 1, -[EKICSPreviewModel shouldAllowUpdateEvent:](self->_model, "shouldAllowUpdateEvent:", contentViewController), -[EKICSPreviewModel shouldAllowDeleteEvent:](self->_model, "shouldAllowDeleteEvent:", contentViewController));
        v25 = (UIViewController *)objc_claimAutoreleasedReturnValue();
        v26 = self->_contentViewController;
        self->_contentViewController = v25;

      }
    }
    else
    {
      v5 = -[EKICSPreviewListController initWithModel:]([EKICSPreviewListController alloc], "initWithModel:", self->_model);
      -[EKICSPreviewListController setListDelegate:](v5, "setListDelegate:", self);
      -[EKICSPreviewListController setAllowsImport:](v5, "setAllowsImport:", self->_allowsImport);
      -[EKICSPreviewListController setAllowsSubitems:](v5, "setAllowsSubitems:", self->_allowsSubitems);
      v6 = *MEMORY[0x1E0DC4A88];
      objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4A88]);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "_scaledValueForValue:", 65.0);
      v9 = v8;
      -[EKICSPreviewListController tableView](v5, "tableView");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setEstimatedRowHeight:", v9);

      objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", v6);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "_scaledValueForValue:", 28.0);
      v13 = v12;
      -[EKICSPreviewListController tableView](v5, "tableView");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "setEstimatedSectionHeaderHeight:", v13);

      v15 = self->_contentViewController;
      self->_contentViewController = &v5->super.super;
      v16 = v5;

      -[EKICSPreviewListController tableView](v16, "tableView");
      contentViewController = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(contentViewController, "sizeThatFits:", EKUIContainedControllerIdealWidth(), 1000.0);
      -[UIViewController setPreferredContentSize:](self->_contentViewController, "setPreferredContentSize:");

    }
  }
  return self->_contentViewController;
}

- (void)_createCancelButtonWithType:(int64_t)a3 target:(id)a4 action:(SEL)a5
{
  objc_class *v8;
  id v9;
  void *v10;
  void *v11;
  id v12;

  if (self->_hasCustomCancelButton)
  {
    self->_cancelButtonType = a3;
    v8 = (objc_class *)MEMORY[0x1E0DC34F0];
    v9 = a4;
    v12 = (id)objc_msgSend([v8 alloc], "initWithBarButtonSystemItem:target:action:", a3, v9, a5);

    -[EKICSPreviewController viewController](self, "viewController");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "navigationItem");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setLeftBarButtonItem:", v12);

  }
}

- (void)_updateCancelButton
{
  uint64_t allowsImport;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  id v11;

  if (self->_hasCustomCancelButton)
  {
    if (-[EKICSPreviewModel unimportedEventCount](self->_model, "unimportedEventCount"))
      allowsImport = self->_allowsImport;
    else
      allowsImport = 0;
    if (allowsImport != self->_cancelButtonType)
    {
      -[EKICSPreviewController viewController](self, "viewController");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "navigationItem");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "leftBarButtonItem");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "target");
      v11 = (id)objc_claimAutoreleasedReturnValue();

      -[EKICSPreviewController viewController](self, "viewController");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "navigationItem");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "leftBarButtonItem");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "action");

      -[EKICSPreviewController _createCancelButtonWithType:target:action:](self, "_createCancelButtonWithType:target:action:", allowsImport, v11, v10);
    }
  }
}

- (void)setCancelButtonWithTarget:(id)a3 action:(SEL)a4
{
  EKICSPreviewModel *model;
  _BOOL8 allowsImport;
  id v8;

  self->_hasCustomCancelButton = 1;
  model = self->_model;
  v8 = a3;
  if (-[EKICSPreviewModel unimportedEventCount](model, "unimportedEventCount"))
    allowsImport = self->_allowsImport;
  else
    allowsImport = 0;
  -[EKICSPreviewController _createCancelButtonWithType:target:action:](self, "_createCancelButtonWithType:target:action:", allowsImport, v8, a4);

}

- (void)icsPreviewListController:(id)a3 didSelectEvent:(id)a4
{
  EKICSPreviewModel *model;
  id v7;
  id v8;
  void *v9;
  void *v10;
  id v11;

  model = self->_model;
  v7 = a4;
  v8 = a3;
  -[EKICSPreviewModel importedEvents](model, "importedEvents");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKICSPreviewController detailViewForEvent:eventInRealStore:showUpdate:showDelete:](self, "detailViewForEvent:eventInRealStore:showUpdate:showDelete:", v7, objc_msgSend(v9, "containsObject:", v7), -[EKICSPreviewModel shouldAllowUpdateEvent:](self->_model, "shouldAllowUpdateEvent:", v7), -[EKICSPreviewModel shouldAllowDeleteEvent:](self->_model, "shouldAllowDeleteEvent:", v7));
  v11 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "navigationController");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "pushViewController:animated:", v11, 1);
}

- (void)presentCalendarChooserForController:(id)a3
{
  EKCalendarChooser *v4;
  EKCalendarChooser *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  id v24;

  v24 = a3;
  v4 = -[EKCalendarChooser initWithSelectionStyle:displayStyle:eventStore:]([EKCalendarChooser alloc], "initWithSelectionStyle:displayStyle:eventStore:", 0, 1, self->_eventStore);
  v5 = v4;
  if (v4)
  {
    -[EKCalendarChooser setChooserMode:](v4, "setChooserMode:", 1);
    -[EKCalendarChooser setDelegate:](v5, "setDelegate:", self);
    -[EKCalendarChooser setShowsDoneButton:](v5, "setShowsDoneButton:", 1);
    -[EKCalendarChooser setShowsCancelButton:](v5, "setShowsCancelButton:", 1);
    EventKitUIBundle();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("Choose Calendar"), &stru_1E601DFA8, 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKCalendarChooser setTitle:](v5, "setTitle:", v7);

    -[EKICSPreviewController _defaultCalendarForImport](self, "_defaultCalendarForImport");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKCalendarChooser setSelectedCalendar:](v5, "setSelectedCalendar:", v8);

    -[EKCalendarChooser setShowDetailAccessories:](v5, "setShowDetailAccessories:", 1);
    -[EKCalendarChooser view](v5, "view");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "frame");
    v11 = v10;
    v13 = v12;
    v15 = v14;

    v16 = EKUIContainedControllerIdealWidth();
    -[EKCalendarChooser view](v5, "view");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setFrame:", v11, v13, v16, v15);

    v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3A40]), "initWithRootViewController:", v5);
    v19 = v18;
    if (v18)
    {
      objc_msgSend(v18, "setModalPresentationStyle:", 3);
      objc_msgSend(v24, "navigationController");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "navigationController");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      if (v20)
        v22 = v20;
      else
        v22 = v24;
      if (v21)
        v22 = v21;
      v23 = v22;
      objc_msgSend(v23, "presentModalViewController:withTransition:", v19, 8);

    }
  }

}

- (BOOL)_calendarSupportsImport:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  char v6;

  v3 = a3;
  objc_msgSend(v3, "source");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "constraints");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v5, "prohibitsICSImport") & 1) != 0)
    v6 = 0;
  else
    v6 = objc_msgSend(v3, "allowsContentModifications");

  return v6;
}

- (void)_enumerateSupportedCalendarsUsingBlock:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[5];
  id v8;
  _QWORD *v9;
  _QWORD v10[4];

  v4 = a3;
  -[EKEventStore readWriteCalendarsForEntityType:](self->_eventStore, "readWriteCalendarsForEntityType:", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = 0;
  v10[1] = v10;
  v10[2] = 0x2020000000;
  v10[3] = 0;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __65__EKICSPreviewController__enumerateSupportedCalendarsUsingBlock___block_invoke;
  v7[3] = &unk_1E601C1C8;
  v7[4] = self;
  v6 = v4;
  v8 = v6;
  v9 = v10;
  objc_msgSend(v5, "enumerateObjectsUsingBlock:", v7);

  _Block_object_dispose(v10, 8);
}

void __65__EKICSPreviewController__enumerateSupportedCalendarsUsingBlock___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if (objc_msgSend(*(id *)(a1 + 32), "_calendarSupportsImport:"))
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
    ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);
  }

}

- (unint64_t)_countOfCalendarsSupportingImport
{
  unint64_t v2;
  _QWORD v4[5];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t v8;

  v5 = 0;
  v6 = &v5;
  v7 = 0x2020000000;
  v8 = 0;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __59__EKICSPreviewController__countOfCalendarsSupportingImport__block_invoke;
  v4[3] = &unk_1E601C1F0;
  v4[4] = &v5;
  -[EKICSPreviewController _enumerateSupportedCalendarsUsingBlock:](self, "_enumerateSupportedCalendarsUsingBlock:", v4);
  v2 = v6[3];
  _Block_object_dispose(&v5, 8);
  return v2;
}

uint64_t __59__EKICSPreviewController__countOfCalendarsSupportingImport__block_invoke(uint64_t result)
{
  ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24);
  return result;
}

- (BOOL)_anyCalendarsSupportingImport
{
  return -[EKICSPreviewController _countOfCalendarsSupportingImport](self, "_countOfCalendarsSupportingImport") != 0;
}

- (BOOL)_shouldShowCalendarChooser
{
  void *v2;
  BOOL v3;

  -[EKEventStore readWriteCalendarsForEntityType:](self->_eventStore, "readWriteCalendarsForEntityType:", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (unint64_t)objc_msgSend(v2, "count") > 1;

  return v3;
}

- (id)_defaultCalendarForImport
{
  void *v3;
  id v4;
  _QWORD v6[5];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  -[EKEventStore defaultCalendarForNewEvents](self->_eventStore, "defaultCalendarForNewEvents");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[EKICSPreviewController _calendarSupportsImport:](self, "_calendarSupportsImport:", v3))
  {
    v4 = v3;
  }
  else
  {
    v7 = 0;
    v8 = &v7;
    v9 = 0x3032000000;
    v10 = __Block_byref_object_copy__19;
    v11 = __Block_byref_object_dispose__19;
    v12 = 0;
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __51__EKICSPreviewController__defaultCalendarForImport__block_invoke;
    v6[3] = &unk_1E601C1F0;
    v6[4] = &v7;
    -[EKICSPreviewController _enumerateSupportedCalendarsUsingBlock:](self, "_enumerateSupportedCalendarsUsingBlock:", v6);
    v4 = (id)v8[5];
    _Block_object_dispose(&v7, 8);

  }
  return v4;
}

void __51__EKICSPreviewController__defaultCalendarForImport__block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
  *a4 = 1;
}

- (void)importAllRequested:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  if (-[EKICSPreviewController _shouldShowCalendarChooser](self, "_shouldShowCalendarChooser"))
  {
    -[EKICSPreviewController presentCalendarChooserForController:](self, "presentCalendarChooserForController:", v5);
  }
  else
  {
    -[EKEventStore defaultCalendarForNewEvents](self->_eventStore, "defaultCalendarForNewEvents");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKICSPreviewController importAllIntoCalendar:](self, "importAllIntoCalendar:", v4);

  }
}

- (void)calendarChooserDidFinish:(id)a3
{
  EKEventViewController *currentImport;
  id v5;
  void *v6;
  EKEventViewController *v7;

  currentImport = self->_currentImport;
  v5 = a3;
  objc_msgSend(v5, "selectedCalendar");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (currentImport)
    -[EKICSPreviewController importEventFromController:intoCalendar:](self, "importEventFromController:intoCalendar:", currentImport, v6);
  else
    -[EKICSPreviewController importAllIntoCalendar:](self, "importAllIntoCalendar:", v6);

  objc_msgSend(v5, "dismissViewControllerAnimated:completion:", 0, 0);
  v7 = self->_currentImport;
  self->_currentImport = 0;

}

- (void)calendarChooserDidCancel:(id)a3
{
  EKEventViewController *currentImport;

  objc_msgSend(a3, "dismissViewControllerAnimated:completion:", 1, 0);
  currentImport = self->_currentImport;
  self->_currentImport = 0;

}

- (void)importAllIntoCalendar:(id)a3
{
  id WeakRetained;
  void *v5;
  id v6;
  char v7;
  _QWORD block[5];

  if (!self->_importing)
  {
    self->_importing = 1;
    -[EKICSPreviewModel importAllIntoCalendar:](self->_model, "importAllIntoCalendar:", a3);
    self->_importing = 0;
    WeakRetained = objc_loadWeakRetained((id *)&self->_previewDelegate);
    if (WeakRetained)
    {
      v5 = WeakRetained;
      v6 = objc_loadWeakRetained((id *)&self->_previewDelegate);
      v7 = objc_opt_respondsToSelector();

      if ((v7 & 1) != 0)
      {
        block[0] = MEMORY[0x1E0C809B0];
        block[1] = 3221225472;
        block[2] = __48__EKICSPreviewController_importAllIntoCalendar___block_invoke;
        block[3] = &unk_1E6018688;
        block[4] = self;
        dispatch_async(MEMORY[0x1E0C80D38], block);
      }
    }
  }
  -[EKICSPreviewController _updateCancelButton](self, "_updateCancelButton", a3);
}

void __48__EKICSPreviewController_importAllIntoCalendar___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 64));
  objc_msgSend(WeakRetained, "icsPreviewControllerImportDidImportEvents:", *(_QWORD *)(a1 + 32));

}

- (void)importEventFromController:(id)a3 intoCalendar:(id)a4
{
  id v6;
  id WeakRetained;
  void *v8;
  id v9;
  char v10;
  id v11;
  EKICSPreviewModel *model;
  void *v13;
  void *v14;
  id v15;

  v15 = a3;
  v6 = a4;
  if (!self->_importing)
  {
    self->_importing = 1;
    WeakRetained = objc_loadWeakRetained((id *)&self->_previewDelegate);
    if (WeakRetained)
    {
      v8 = WeakRetained;
      v9 = objc_loadWeakRetained((id *)&self->_previewDelegate);
      v10 = objc_opt_respondsToSelector();

      if ((v10 & 1) != 0)
      {
        v11 = objc_loadWeakRetained((id *)&self->_previewDelegate);
        objc_msgSend(v11, "icsPreviewControllerImportDidStart:", self);

      }
    }
    model = self->_model;
    objc_msgSend(v15, "event");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKICSPreviewModel importEvent:intoCalendar:](model, "importEvent:intoCalendar:", v13, v6);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (v14)
      -[EKICSPreviewController handleDidImportEvent:fromController:intoCalendar:](self, "handleDidImportEvent:fromController:intoCalendar:", v14, v15, v6);
    else
      -[EKICSPreviewController handleImportEventError](self, "handleImportEventError");
    self->_importing = 0;

  }
  -[EKICSPreviewController _updateCancelButton](self, "_updateCancelButton");

}

- (void)handleDidImportEvent:(id)a3 fromController:(id)a4 intoCalendar:(id)a5
{
  id v7;
  id v8;
  id WeakRetained;
  void *v10;
  id v11;
  char v12;
  id v13;

  v7 = a4;
  v8 = a3;
  objc_msgSend(v7, "setICSPreview:", 0);
  objc_msgSend(v7, "setEvent:", v8);

  objc_msgSend(v7, "preferredContentSize");
  objc_msgSend(v7, "setPreferredContentSize:");

  WeakRetained = objc_loadWeakRetained((id *)&self->_previewDelegate);
  if (WeakRetained)
  {
    v10 = WeakRetained;
    v11 = objc_loadWeakRetained((id *)&self->_previewDelegate);
    v12 = objc_opt_respondsToSelector();

    if ((v12 & 1) != 0)
    {
      v13 = objc_loadWeakRetained((id *)&self->_previewDelegate);
      objc_msgSend(v13, "icsPreviewControllerImportDidImportEvents:", self);

    }
  }
}

- (void)handleImportEventError
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id WeakRetained;
  char v12;
  id v13;
  id v14;

  EventKitUIBundle();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("Error Importing Event"), &stru_1E601DFA8, 0);
  v14 = (id)objc_claimAutoreleasedReturnValue();

  EventKitUIBundle();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("There was a problem adding this event to the calendar."), &stru_1E601DFA8, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  EventKitUIBundle();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("OK"), &stru_1E601DFA8, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0DC3450], "alertControllerWithTitle:message:preferredStyle:", v14, v5, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3448], "actionWithTitle:style:handler:", v7, 1, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addAction:", v9);

  -[EKICSPreviewController viewController](self, "viewController");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "presentViewController:animated:completion:", v8, 1, 0);

  WeakRetained = objc_loadWeakRetained((id *)&self->_previewDelegate);
  v12 = objc_opt_respondsToSelector();

  if ((v12 & 1) != 0)
  {
    v13 = objc_loadWeakRetained((id *)&self->_previewDelegate);
    objc_msgSend(v13, "icsPreviewControllerImportDidFail:", self);

  }
}

- (void)eventViewControllerDidRequestAddToCalendar:(id)a3
{
  id v5;
  EKICSPreviewModel *model;
  void *v7;
  _BOOL4 v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  id v15;

  v5 = a3;
  model = self->_model;
  v15 = v5;
  objc_msgSend(v5, "event");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[EKICSPreviewModel shouldAllowUpdateEvent:](model, "shouldAllowUpdateEvent:", v7);

  if (!-[EKICSPreviewController _shouldShowCalendarChooser](self, "_shouldShowCalendarChooser") || v8)
  {
    -[EKEventStore defaultCalendarForNewEvents](self->_eventStore, "defaultCalendarForNewEvents");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      -[EKICSPreviewModel eventStore](self->_model, "eventStore");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "event");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "uniqueId");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "eventWithUniqueId:", v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v13, "calendar");
      v14 = objc_claimAutoreleasedReturnValue();

      v9 = (void *)v14;
    }
    -[EKICSPreviewController importEventFromController:intoCalendar:](self, "importEventFromController:intoCalendar:", v15, v9);

  }
  else
  {
    objc_storeStrong((id *)&self->_currentImport, a3);
    -[EKICSPreviewController presentCalendarChooserForController:](self, "presentCalendarChooserForController:", v15);
  }

}

- (BOOL)eventViewControllerShouldDismissSelf:(id)a3
{
  void *v3;
  char v4;

  -[EKICSPreviewController previewDelegate](self, "previewDelegate", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_opt_respondsToSelector();

  return (v4 & 1) == 0;
}

- (BOOL)eventViewControllerShouldAlwaysShowNavBar:(id)a3
{
  return 1;
}

- (void)eventViewController:(id)a3 didCompleteWithAction:(int64_t)a4
{
  void *v5;
  char v6;
  void *v7;
  NSObject *v8;
  void *v9;
  id v10;
  uint8_t buf[4];
  const char *v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  -[EKICSPreviewController previewDelegate](self, "previewDelegate", a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    -[EKICSPreviewController previewDelegate](self, "previewDelegate");
    v10 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "icsPreviewControllerWantsDismissal:", self);

  }
  else
  {
    v7 = (void *)kEKUILogHandle;
    if (os_log_type_enabled((os_log_t)kEKUILogHandle, OS_LOG_TYPE_ERROR))
    {
      v8 = v7;
      -[EKICSPreviewController previewDelegate](self, "previewDelegate");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315394;
      v12 = "-[EKICSPreviewController eventViewController:didCompleteWithAction:]";
      v13 = 2112;
      v14 = v9;
      _os_log_impl(&dword_1AF84D000, v8, OS_LOG_TYPE_ERROR, "%s called on EKICSPreviewController but the preview delegate [%@] doesn't implement -[EKICSPreviewControllerDelegate icsPreviewControllerWantsDismissal]", buf, 0x16u);

    }
  }
}

- (void)attemptDisplayReviewPrompt
{
  EKICSPreviewControllerDelegate **p_previewDelegate;
  id WeakRetained;
  char v4;
  id v5;

  p_previewDelegate = &self->_previewDelegate;
  WeakRetained = objc_loadWeakRetained((id *)&self->_previewDelegate);
  v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) != 0)
  {
    v5 = objc_loadWeakRetained((id *)p_previewDelegate);
    objc_msgSend(v5, "attemptDisplayReviewPrompt");

  }
}

- (EKICSPreviewControllerDelegate)previewDelegate
{
  return (EKICSPreviewControllerDelegate *)objc_loadWeakRetained((id *)&self->_previewDelegate);
}

- (void)setPreviewDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_previewDelegate, a3);
}

- (EKICSPreviewModel)model
{
  return self->_model;
}

- (BOOL)showListViewForOneEvent
{
  return self->_showListViewForOneEvent;
}

- (void)setShowListViewForOneEvent:(BOOL)a3
{
  self->_showListViewForOneEvent = a3;
}

- (BOOL)allowsImport
{
  return self->_allowsImport;
}

- (void)setAllowsImport:(BOOL)a3
{
  self->_allowsImport = a3;
}

- (BOOL)allowsEditing
{
  return self->_allowsEditing;
}

- (void)setAllowsEditing:(BOOL)a3
{
  self->_allowsEditing = a3;
}

- (BOOL)allowsSubitems
{
  return self->_allowsSubitems;
}

- (void)setAllowsSubitems:(BOOL)a3
{
  self->_allowsSubitems = a3;
}

- (unint64_t)actionsState
{
  return self->_actionsState;
}

- (void)setActionsState:(unint64_t)a3
{
  self->_actionsState = a3;
}

- (int)eventUID
{
  return self->_eventUID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_model, 0);
  objc_destroyWeak((id *)&self->_previewDelegate);
  objc_storeStrong((id *)&self->_contentViewController, 0);
  objc_storeStrong((id *)&self->_currentImport, 0);
  objc_storeStrong((id *)&self->_eventStore, 0);
  objc_storeStrong((id *)&self->_eventFromUID, 0);
}

@end
