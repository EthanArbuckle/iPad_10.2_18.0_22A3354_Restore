@implementation EKSubscribedCalendarEditor

- (EKSubscribedCalendarEditor)initWithCalendar:(id)a3 eventStore:(id)a4 entityType:(unint64_t)a5 limitedToSource:(id)a6
{
  id v10;
  id v11;
  id v12;
  EKSubscribedCalendarEditor *v13;
  CUIKSubscribedCalendarManager *v14;
  CUIKSubscribedCalendarManager *subCalManager;
  uint64_t v16;
  void *v17;
  id v18;
  _QWORD v20[4];
  id v21;
  id location;
  objc_super v23;
  _QWORD v24[2];

  v24[1] = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a6;
  v23.receiver = self;
  v23.super_class = (Class)EKSubscribedCalendarEditor;
  v13 = -[EKAbstractCalendarEditor initWithCalendar:eventStore:entityType:limitedToSource:](&v23, sel_initWithCalendar_eventStore_entityType_limitedToSource_, v10, v11, a5, v12);
  if (v13)
  {
    v14 = (CUIKSubscribedCalendarManager *)objc_alloc_init(MEMORY[0x1E0D0CE10]);
    subCalManager = v13->_subCalManager;
    v13->_subCalManager = v14;

    objc_storeStrong((id *)&v13->_limitedToSource, a6);
    if (-[EKAbstractCalendarEditor isNewCalendar](v13, "isNewCalendar"))
      v16 = 0;
    else
      v16 = 3;
    -[EKSubscribedCalendarEditor setState:](v13, "setState:", v16);
    objc_initWeak(&location, v13);
    v24[0] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v24, 1);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = __85__EKSubscribedCalendarEditor_initWithCalendar_eventStore_entityType_limitedToSource___block_invoke;
    v20[3] = &unk_1E6018610;
    objc_copyWeak(&v21, &location);
    v18 = (id)-[EKSubscribedCalendarEditor registerForTraitChanges:withHandler:](v13, "registerForTraitChanges:withHandler:", v17, v20);

    objc_destroyWeak(&v21);
    objc_destroyWeak(&location);
  }

  return v13;
}

void __85__EKSubscribedCalendarEditor_initWithCalendar_eventStore_entityType_limitedToSource___block_invoke(uint64_t a1)
{
  id *WeakRetained;
  void *v2;
  id *v3;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v3 = WeakRetained;
    objc_msgSend(WeakRetained[140], "reset");
    objc_msgSend(v3, "tableView");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "reloadData");

    WeakRetained = v3;
  }

}

+ (id)createNewCalendarForEntityType:(unint64_t)a3 inEventStore:(id)a4
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CA9FF0], "calendarForEntityType:eventStore:", 0, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setSubscribed:", 1);
  objc_msgSend(v4, "setReadOnly:", 1);
  objc_msgSend(v4, "setStripAlarms:", 1);
  objc_msgSend(v4, "setStripAttachments:", 1);
  return v4;
}

- (void)setHolidayCalendarModeWithTitle:(id)a3
{
  self->_holidayCalendarMode = 1;
  objc_storeStrong((id *)&self->_preloadTitle, a3);
}

- (void)loadView
{
  BOOL v3;
  void *v4;
  void *v5;
  const __CFString *v6;
  const __CFString *v7;
  void *v8;
  objc_super v9;

  if (!self->_holidayCalendarMode)
  {
    v3 = -[EKAbstractCalendarEditor isNewCalendar](self, "isNewCalendar");
    EventKitUIBundle();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v4;
    if (v3)
    {
      v6 = CFSTR("Add Subscription Calendar Title");
      v7 = CFSTR("Add Subscription Calendar");
    }
    else
    {
      v6 = CFSTR("Edit Subscribed Calendar");
      v7 = &stru_1E601DFA8;
    }
    objc_msgSend(v4, "localizedStringForKey:value:table:", v6, v7, 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKSubscribedCalendarEditor setTitle:](self, "setTitle:", v8);

  }
  v9.receiver = self;
  v9.super_class = (Class)EKSubscribedCalendarEditor;
  -[EKAbstractCalendarEditor loadView](&v9, sel_loadView);
  -[EKSubscribedCalendarEditor _setTableHeaderViewForState](self, "_setTableHeaderViewForState");
  self->_allowTableHeaderLayouts = 1;
}

- (id)rightButton
{
  BOOL v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = -[EKAbstractCalendarEditor isNewCalendar](self, "isNewCalendar");
  v4 = objc_alloc(MEMORY[0x1E0DC34F0]);
  v5 = v4;
  if (v3)
  {
    EventKitUIBundle();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("Add New Subscribed Calendar Confirm Button"), CFSTR("Add"), 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_msgSend(v5, "initWithTitle:style:target:action:", v7, 2, self, sel_done_);

  }
  else
  {
    v8 = (void *)objc_msgSend(v4, "initWithBarButtonSystemItem:target:action:", 0, self, sel_done_);
  }
  return v8;
}

- (void)viewDidAppear:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  objc_super v7;

  v3 = a3;
  if (-[EKAbstractCalendarEditor isNewCalendar](self, "isNewCalendar") && !self->_holidayCalendarMode)
  {
    if (-[EKSubscribedCalendarEditor _needToShowPrivacyNotice](self, "_needToShowPrivacyNotice"))
      -[EKSubscribedCalendarEditor _showPrivacyNotice](self, "_showPrivacyNotice");
    -[EKAbstractCalendarEditor editItems](self, "editItems");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectAtIndex:", 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "becomeFirstResponder");

  }
  self->_allowTableHeaderLayouts = 1;
  v7.receiver = self;
  v7.super_class = (Class)EKSubscribedCalendarEditor;
  -[EKSubscribedCalendarEditor viewDidAppear:](&v7, sel_viewDidAppear_, v3);
  if (self->_holidayCalendarMode && -[EKSubscribedCalendarEditor state](self, "state") != 1)
    -[EKSubscribedCalendarEditor _validateURL](self, "_validateURL");
}

- (BOOL)_needToShowPrivacyNotice
{
  void *v2;
  int v3;

  if (_os_feature_enabled_impl())
  {
    objc_msgSend(MEMORY[0x1E0D0CDE0], "sharedPreferences");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = objc_msgSend(v2, "displayedSubscribedCalendarSpamDetectionPrivacyNotice") ^ 1;

  }
  else
  {
    LOBYTE(v3) = 0;
  }
  return v3;
}

- (void)viewWillAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)EKSubscribedCalendarEditor;
  -[EKAbstractCalendarEditor viewWillAppear:](&v4, sel_viewWillAppear_, a3);
  -[EKSubscribedCalendarEditor _setTableHeaderViewForState](self, "_setTableHeaderViewForState");
}

- (void)viewWillDisappear:(BOOL)a3
{
  objc_super v3;

  self->_allowTableHeaderLayouts = 0;
  v3.receiver = self;
  v3.super_class = (Class)EKSubscribedCalendarEditor;
  -[EKAbstractCalendarEditor viewWillDisappear:](&v3, sel_viewWillDisappear_, a3);
}

- (void)_setTableHeaderViewForState
{
  void *v3;
  void *v4;
  EKSubscribedCalendarDescriptionHeader *v5;
  EKSubscribedCalendarDescriptionHeader *tableViewHeader;
  void *v7;
  _BOOL4 v8;
  EKSubscribedCalendarDescriptionHeader *v9;
  void *v10;
  EKSubscribedCalendarDescriptionHeader *v11;
  EKSubscribedCalendarDescriptionHeader *v12;
  CGRect v13;

  -[EKSubscribedCalendarEditor tableView](self, "tableView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "tableHeaderView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (self->_state != 3)
  {
    v8 = v4 != 0;
    v9 = [EKSubscribedCalendarDescriptionHeader alloc];
    -[EKSubscribedCalendarEditor tableView](self, "tableView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "bounds");
    v12 = -[EKSubscribedCalendarDescriptionHeader initWithParentWidth:showHolidayCalendarDescription:](v9, "initWithParentWidth:showHolidayCalendarDescription:", self->_holidayCalendarMode, CGRectGetWidth(v13));

    v5 = v12;
    if (((v8 ^ (v12 == 0)) & 1) == 0)
      goto LABEL_3;
LABEL_5:
    v11 = v5;
    -[EKSubscribedCalendarEditor _updateTableHeaderLayout](self, "_updateTableHeaderLayout");
    goto LABEL_6;
  }
  v5 = 0;
  if (!v4)
    goto LABEL_5;
LABEL_3:
  v11 = v5;
  objc_storeStrong((id *)&self->_tableViewHeader, v5);
  tableViewHeader = self->_tableViewHeader;
  -[EKSubscribedCalendarEditor tableView](self, "tableView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setTableHeaderView:", tableViewHeader);

LABEL_6:
}

- (void)_updateTableHeaderLayout
{
  EKSubscribedCalendarDescriptionHeader *tableViewHeader;
  void *v4;
  void *v5;
  EKSubscribedCalendarDescriptionHeader *v6;
  id v7;
  CGRect v8;

  tableViewHeader = self->_tableViewHeader;
  -[EKSubscribedCalendarEditor tableView](self, "tableView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bounds");
  LODWORD(tableViewHeader) = -[EKSubscribedCalendarDescriptionHeader updateLayoutForWidth:](tableViewHeader, "updateLayoutForWidth:", CGRectGetWidth(v8));

  if ((_DWORD)tableViewHeader)
  {
    -[EKSubscribedCalendarEditor tableView](self, "tableView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setTableHeaderView:", 0);

    v6 = self->_tableViewHeader;
    -[EKSubscribedCalendarEditor tableView](self, "tableView");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setTableHeaderView:", v6);

  }
}

- (BOOL)_shouldShowDeleteButton
{
  void *v3;
  char v4;
  void *v5;
  char v6;
  void *v8;
  char v9;

  if (-[EKAbstractCalendarEditor isNewCalendar](self, "isNewCalendar"))
    return 0;
  -[EKAbstractCalendarEditor calendar](self, "calendar");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isImmutable");

  if ((v4 & 1) != 0)
    return 0;
  -[EKAbstractCalendarEditor calendar](self, "calendar");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isSubscribedHolidayCalendar");

  if ((v6 & 1) != 0)
    return 0;
  -[EKAbstractCalendarEditor calendar](self, "calendar");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isMarkedUndeletable");

  return v9 ^ 1;
}

- (void)contentSizeCategoryDidChangeNotification:(id)a3
{
  id v4;

  -[EKCalendarColorEditItem reset](self->_colorEditItem, "reset", a3);
  -[EKSubscribedCalendarEditor tableView](self, "tableView");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "reloadData");

}

- (void)setState:(unint64_t)a3
{
  _BOOL4 v4;
  void *v5;
  void *v6;
  id v7;

  if (self->_state != a3)
  {
    self->_state = a3;
    -[EKSubscribedCalendarEditor _setTableHeaderViewForState](self, "_setTableHeaderViewForState");
    -[EKAbstractCalendarEditor reconfigureAndReloadEditItems](self, "reconfigureAndReloadEditItems");
    if (self->_state == 1)
    {
      v4 = -[EKAbstractCalendarEditor enableDoneInitially](self, "enableDoneInitially");
      -[EKSubscribedCalendarEditor navigationItem](self, "navigationItem");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = v5;
      if (v4)
        objc_msgSend(v5, "leftBarButtonItem");
      else
        objc_msgSend(v5, "rightBarButtonItem");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setEnabled:", 1);

    }
  }
}

- (id)loadEditItems
{
  return -[EKSubscribedCalendarEditor _editItemsForState:](self, "_editItemsForState:", self->_state);
}

- (id)_editItemsForState:(unint64_t)a3
{
  id v5;
  EKCalendarSubscriptionURLEditItem *v6;
  EKCalendarSubscriptionURLEditItem *urlItem;
  void *v8;
  void *v9;
  void *v10;
  EKCalendarValidateEditItem *v11;
  EKCalendarValidateEditItem *validateItem;
  EKCalendarSubscriptionSpamCheckEditItem *v13;
  EKCalendarSubscriptionSpamCheckEditItem *spamCheckItem;
  EKCalendarCancelValidationEditItem *v15;
  EKCalendarCancelValidationEditItem *cancelValidationItem;
  EKCalendarCancelValidationEditItem *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  EKCalendarValidateEditItem *v23;
  EKCalendarSubscriptionSpamCheckEditItem *v24;
  void *v25;
  EKCalendarValidateEditItem **v26;
  uint64_t v27;
  EKCalendarSubscriptionURLEditItem *v28;
  EKCalendarSubscriptionURLEditItem *v29;
  EKCalendarPreviewEventsEditItem *v30;
  EKCalendarTitleEditItem *v31;
  EKCalendarSubscriptionDetailsEditItem *v32;
  EKCalendarColorEditItem *v33;
  EKCalendarColorEditItem *colorEditItem;
  EKCalendarIgnoreAlertsEditItem *v35;
  EKCalendarSubscriptionDetailsEditItem *v36;
  EKCalendarSubscriptionDetailsEditItem *v37;
  EKCalendarColorEditItem *v38;
  void *v39;
  _QWORD *v40;
  uint64_t v41;
  EKCalendarColorEditItem *v42;
  EKCalendarColorEditItem *v43;
  EKCalendarColorEditItem *v44;
  void *v45;
  void *v46;
  void *v47;
  EKCalendarColorEditItem *v48;
  void *v49;
  EKCalendarValidateEditItem *v50;
  EKCalendarValidateEditItem *v51;
  void *v52;
  void *v53;
  _QWORD v55[5];
  _QWORD v56[4];
  _QWORD v57[2];
  EKCalendarValidateEditItem *v58;
  _QWORD v59[7];
  _QWORD v60[6];
  _QWORD v61[2];
  _QWORD v62[6];

  v62[4] = *MEMORY[0x1E0C80C00];
  v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  switch(a3)
  {
    case 0uLL:
      v6 = objc_alloc_init(EKCalendarSubscriptionURLEditItem);
      urlItem = self->_urlItem;
      self->_urlItem = v6;

      -[EKCalendarSubscriptionURLEditItem setEditable:](self->_urlItem, "setEditable:", 1);
      -[EKCalendarSubscriptionURLEditItem setUrlEditItemDelegate:](self->_urlItem, "setUrlEditItemDelegate:", self);
      -[EKSubscribedCalendarEditor prefillURL](self, "prefillURL");
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      if (v8)
      {
        -[EKSubscribedCalendarEditor prefillURL](self, "prefillURL");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "absoluteString");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        -[EKCalendarSubscriptionURLEditItem setUrlString:](self->_urlItem, "setUrlString:", v10);

      }
      v11 = objc_alloc_init(EKCalendarValidateEditItem);
      validateItem = self->_validateItem;
      self->_validateItem = v11;

      -[EKCalendarButtonEditItem setButtonTarget:action:](self->_validateItem, "setButtonTarget:action:", self, sel__validateURL_);
      if (_os_feature_enabled_impl())
      {
        v13 = objc_alloc_init(EKCalendarSubscriptionSpamCheckEditItem);
        spamCheckItem = self->_spamCheckItem;
        self->_spamCheckItem = v13;

        -[EKCalendarSubscriptionSpamCheckEditItem setSubscriptionSpamDelegate:](self->_spamCheckItem, "setSubscriptionSpamDelegate:", self);
        v15 = objc_alloc_init(EKCalendarCancelValidationEditItem);
        cancelValidationItem = self->_cancelValidationItem;
        self->_cancelValidationItem = v15;

        -[EKCalendarCancelValidationEditItem setHidden:](self->_cancelValidationItem, "setHidden:", 1);
        -[EKCalendarButtonEditItem setButtonTarget:action:](self->_cancelValidationItem, "setButtonTarget:action:", self, sel_cancel_);
        v17 = self->_cancelValidationItem;
        EventKitUIBundle();
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "localizedStringForKey:value:table:", CFSTR("Cancel - Adding Subscription"), CFSTR("Cancel"), 0);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        -[EKCalendarButtonEditItem setButtonTitle:](v17, "setButtonTitle:", v19);

      }
      -[EKSubscribedCalendarEditor prefillURL](self, "prefillURL");
      v20 = (void *)objc_claimAutoreleasedReturnValue();

      if (v20)
      {
        -[EKSubscribedCalendarEditor prefillURL](self, "prefillURL");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "absoluteString");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        -[EKSubscribedCalendarEditor _startSpamCheckingURLString:](self, "_startSpamCheckingURLString:", v22);

      }
      if (!self->_holidayCalendarMode)
      {
        if (_os_feature_enabled_impl())
        {
          v23 = self->_validateItem;
          v62[0] = self->_urlItem;
          v62[1] = v23;
          v24 = self->_spamCheckItem;
          v62[2] = self->_cancelValidationItem;
          v62[3] = v24;
          v25 = (void *)MEMORY[0x1E0C99D20];
          v26 = (EKCalendarValidateEditItem **)v62;
          v27 = 4;
          goto LABEL_27;
        }
        v51 = self->_validateItem;
        v61[0] = self->_urlItem;
        v61[1] = v51;
        v25 = (void *)MEMORY[0x1E0C99D20];
        v26 = (EKCalendarValidateEditItem **)v61;
        goto LABEL_26;
      }
      break;
    case 1uLL:
      v28 = objc_alloc_init(EKCalendarSubscriptionURLEditItem);
      v29 = self->_urlItem;
      self->_urlItem = v28;

      -[EKCalendarSubscriptionURLEditItem setEditable:](self->_urlItem, "setEditable:", 0);
      v30 = -[EKCalendarPreviewEventsEditItem initWithPreviewSummary:]([EKCalendarPreviewEventsEditItem alloc], "initWithPreviewSummary:", self->_previewSummary);
      v31 = objc_alloc_init(EKCalendarTitleEditItem);
      -[EKCalendarTitleEditItem setShowHeader:](v31, "setShowHeader:", 1);
      if (self->_holidayCalendarMode && -[NSString length](self->_preloadTitle, "length"))
        -[EKCalendarTitleEditItem setPrefillTitle:](v31, "setPrefillTitle:", self->_preloadTitle);
      v32 = -[EKCalendarAccountEditItem initLimitedToSource:]([EKCalendarAccountEditItem alloc], "initLimitedToSource:", self->_limitedToSource);
      -[EKCalendarSubscriptionDetailsEditItem setEditable:](v32, "setEditable:", 1);
      v33 = objc_alloc_init(EKCalendarColorEditItem);
      colorEditItem = self->_colorEditItem;
      self->_colorEditItem = v33;

      v35 = objc_alloc_init(EKCalendarIgnoreAlertsEditItem);
      v36 = objc_alloc_init(EKCalendarSubscriptionDetailsEditItem);
      v37 = v36;
      if (self->_holidayCalendarMode)
      {
        v60[0] = v31;
        v60[1] = v30;
        v38 = self->_colorEditItem;
        v60[2] = v32;
        v60[3] = v38;
        v60[4] = v35;
        v60[5] = v36;
        v39 = (void *)MEMORY[0x1E0C99D20];
        v40 = v60;
        v41 = 6;
      }
      else
      {
        v59[0] = self->_urlItem;
        v59[1] = v31;
        v48 = self->_colorEditItem;
        v59[2] = v30;
        v59[3] = v32;
        v59[4] = v48;
        v59[5] = v35;
        v59[6] = v36;
        v39 = (void *)MEMORY[0x1E0C99D20];
        v40 = v59;
        v41 = 7;
      }
      objc_msgSend(v39, "arrayWithObjects:count:", v40, v41);
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "addObjectsFromArray:", v49);

      goto LABEL_22;
    case 2uLL:
      -[EKCalendarValidateEditItem setShowError:](self->_validateItem, "setShowError:", 1);
      if (self->_holidayCalendarMode)
      {
        v58 = self->_validateItem;
        v25 = (void *)MEMORY[0x1E0C99D20];
        v26 = &v58;
        v27 = 1;
      }
      else
      {
        v50 = self->_validateItem;
        v57[0] = self->_urlItem;
        v57[1] = v50;
        v25 = (void *)MEMORY[0x1E0C99D20];
        v26 = (EKCalendarValidateEditItem **)v57;
LABEL_26:
        v27 = 2;
      }
LABEL_27:
      objc_msgSend(v25, "arrayWithObjects:count:", v26, v27);
      v30 = (EKCalendarPreviewEventsEditItem *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "addObjectsFromArray:", v30);
      goto LABEL_28;
    case 3uLL:
      v30 = objc_alloc_init(EKCalendarTitleEditItem);
      -[EKCalendarPreviewEventsEditItem setShowHeader:](v30, "setShowHeader:", 0);
      v42 = objc_alloc_init(EKCalendarColorEditItem);
      v43 = self->_colorEditItem;
      self->_colorEditItem = v42;

      -[EKCalendarColorEditItem setLayoutInline:](self->_colorEditItem, "setLayoutInline:", 0);
      v31 = objc_alloc_init(EKCalendarIgnoreAlertsEditItem);
      v32 = objc_alloc_init(EKCalendarSubscriptionDetailsEditItem);
      v44 = self->_colorEditItem;
      v56[0] = v30;
      v56[1] = v44;
      v56[2] = v31;
      v56[3] = v32;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v56, 4);
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "addObjectsFromArray:", v45);

      if (-[EKSubscribedCalendarEditor _shouldShowDeleteButton](self, "_shouldShowDeleteButton"))
      {
        v35 = objc_alloc_init(EKCalendarButtonEditItem);
        -[EKCalendarIgnoreAlertsEditItem setButtonTarget:action:](v35, "setButtonTarget:action:", self, sel__unsubscribeTapped_);
        EventKitUIBundle();
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v46, "localizedStringForKey:value:table:", CFSTR("Unsubscribe"), &stru_1E601DFA8, 0);
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        -[EKCalendarIgnoreAlertsEditItem setButtonTitle:](v35, "setButtonTitle:", v47);

        objc_msgSend(v5, "addObject:", v35);
LABEL_22:

      }
LABEL_28:

      break;
    default:
      break;
  }
  v55[0] = MEMORY[0x1E0C809B0];
  v55[1] = 3221225472;
  v55[2] = __49__EKSubscribedCalendarEditor__editItemsForState___block_invoke;
  v55[3] = &unk_1E601C990;
  v55[4] = self;
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", v55);
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "filteredArrayUsingPredicate:", v52);
  v53 = (void *)objc_claimAutoreleasedReturnValue();

  return v53;
}

uint64_t __49__EKSubscribedCalendarEditor__editItemsForState___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "calendar");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "eventStore");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v4, "configureWithCalendar:store:", v5, v6);

  return v7;
}

- (void)cancel:(id)a3
{
  id v4;
  objc_super v5;

  v4 = a3;
  -[EKSubscribedCalendarEditor _cancelInFlightPreviewDataFetch](self, "_cancelInFlightPreviewDataFetch");
  v5.receiver = self;
  v5.super_class = (Class)EKSubscribedCalendarEditor;
  -[EKAbstractCalendarEditor cancel:](&v5, sel_cancel_, v4);

}

- (void)willSaveCalendar:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  void *i;
  void *v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "source");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    v15 = 0u;
    v16 = 0u;
    v13 = 0u;
    v14 = 0u;
    -[EKAbstractCalendarEditor eventStore](self, "eventStore", 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "sources");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v8 = (id)objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    if (v8)
    {
      v9 = *(_QWORD *)v14;
      while (2)
      {
        for (i = 0; i != v8; i = (char *)i + 1)
        {
          if (*(_QWORD *)v14 != v9)
            objc_enumerationMutation(v7);
          v11 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)i);
          if (objc_msgSend(v11, "sourceType") == 4)
          {
            v8 = v11;
            goto LABEL_12;
          }
        }
        v8 = (id)objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
        if (v8)
          continue;
        break;
      }
    }
LABEL_12:

    -[EKAbstractCalendarEditor calendar](self, "calendar");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setSource:", v8);

  }
  if ((objc_msgSend(v4, "isSubscribedHolidayCalendar") & 1) == 0)
  {
    -[CUIKSubscribedCalendarManager shutdownDAForCalendarUpdates](self->_subCalManager, "shutdownDAForCalendarUpdates");
    -[CUIKSubscribedCalendarManager updateOrCreateAccountWithCalendar:previousAccountID:newUsername:newPassword:newAllowsInsecureConnections:](self->_subCalManager, "updateOrCreateAccountWithCalendar:previousAccountID:newUsername:newPassword:newAllowsInsecureConnections:", v4, 0, self->_username, self->_password, self->_insecureConnectionApproved);
  }

}

- (void)didSaveCalendar:(id)a3
{
  if ((objc_msgSend(a3, "isSubscribedHolidayCalendar") & 1) == 0)
    -[CUIKSubscribedCalendarManager restartDAAfterCalendarUpdates](self->_subCalManager, "restartDAAfterCalendarUpdates");
}

- (void)_unsubscribeFromCalendar
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  char v8;
  id v9;

  v3 = (void *)MEMORY[0x1E0D0CE18];
  -[EKAbstractCalendarEditor calendar](self, "calendar");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "unsubscribeFromCalendar:", v4);

  -[EKAbstractCalendarEditor delegate](self, "delegate");
  v5 = objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = (void *)v5;
    -[EKAbstractCalendarEditor delegate](self, "delegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_opt_respondsToSelector();

    if ((v8 & 1) != 0)
    {
      -[EKAbstractCalendarEditor delegate](self, "delegate");
      v9 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "calendarEditor:didCompleteWithAction:", self, 2);

    }
  }
}

- (void)_unsubscribeFromCalendarAndReportJunk
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  char v8;
  id v9;

  v3 = (void *)MEMORY[0x1E0D0CE18];
  -[EKAbstractCalendarEditor calendar](self, "calendar");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "unsubscribeFromCalendar:reportAsJunk:", v4, 1);

  -[EKAbstractCalendarEditor delegate](self, "delegate");
  v5 = objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = (void *)v5;
    -[EKAbstractCalendarEditor delegate](self, "delegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_opt_respondsToSelector();

    if ((v8 & 1) != 0)
    {
      -[EKAbstractCalendarEditor delegate](self, "delegate");
      v9 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "calendarEditor:didCompleteWithAction:", self, 2);

    }
  }
}

- (void)_unsubscribeTapped:(id)a3
{
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
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
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  void *v34;
  void *v35;
  id v36;
  _QWORD v37[5];
  _QWORD v38[5];

  v36 = a3;
  -[EKAbstractCalendarEditor calendar](self, "calendar");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("EKSubscribedCalendarEditor.m"), 421, CFSTR("-[EKSubscribedCalendarEditor _unsubscribeTapped]: There is no calendar to unsubscribe from."));

  }
  EventKitUIBundle();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("Are you sure you want to unsubscribe from this calendar? All events associated with the calendar will also be deleted."), &stru_1E601DFA8, 0);
  v7 = objc_claimAutoreleasedReturnValue();

  v8 = (void *)MEMORY[0x1E0DC3448];
  EventKitUIBundle();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "localizedStringForKey:value:table:", CFSTR("Unsubscribe"), &stru_1E601DFA8, 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = MEMORY[0x1E0C809B0];
  v38[0] = MEMORY[0x1E0C809B0];
  v38[1] = 3221225472;
  v38[2] = __49__EKSubscribedCalendarEditor__unsubscribeTapped___block_invoke;
  v38[3] = &unk_1E60185C0;
  v38[4] = self;
  objc_msgSend(v8, "actionWithTitle:style:handler:", v10, 2, v38);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = (void *)MEMORY[0x1E0DC3448];
  EventKitUIBundle();
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "localizedStringForKey:value:table:", CFSTR("Unsubscribe and Report Junk"), &stru_1E601DFA8, 0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v37[0] = v11;
  v37[1] = 3221225472;
  v37[2] = __49__EKSubscribedCalendarEditor__unsubscribeTapped___block_invoke_2;
  v37[3] = &unk_1E60185C0;
  v37[4] = self;
  objc_msgSend(v13, "actionWithTitle:style:handler:", v15, 2, v37);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v17 = (void *)v7;
  objc_msgSend(MEMORY[0x1E0DC3450], "alertControllerWithTitle:message:preferredStyle:", v7, 0, 0);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "addAction:", v12);
  objc_msgSend(v18, "addAction:", v16);
  v19 = (void *)MEMORY[0x1E0DC3448];
  EventKitUIBundle();
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "localizedStringForKey:value:table:", CFSTR("Cancel - unsubscribe clicked"), CFSTR("Cancel"), 0);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "actionWithTitle:style:handler:", v21, 1, 0);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "addAction:", v22);

  objc_msgSend(v36, "buttonView");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "popoverPresentationController");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "setSourceView:", v23);

  objc_msgSend(v36, "buttonView");
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v25, "bounds");
  v27 = v26;
  v29 = v28;
  v31 = v30;
  v33 = v32;
  objc_msgSend(v18, "popoverPresentationController");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "setSourceRect:", v27, v29, v31, v33);

  -[EKSubscribedCalendarEditor presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v18, 1, 0);
}

uint64_t __49__EKSubscribedCalendarEditor__unsubscribeTapped___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_unsubscribeFromCalendar");
}

uint64_t __49__EKSubscribedCalendarEditor__unsubscribeTapped___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_unsubscribeFromCalendarAndReportJunk");
}

- (void)_validateURL:(id)a3
{
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
  _QWORD v15[5];

  if (-[EKCalendarValidateEditItem URLIsSpam](self->_validateItem, "URLIsSpam", a3))
  {
    v4 = (void *)MEMORY[0x1E0DC3448];
    EventKitUIBundle();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("Subscribe Anyway"), &stru_1E601DFA8, 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __43__EKSubscribedCalendarEditor__validateURL___block_invoke;
    v15[3] = &unk_1E60185C0;
    v15[4] = self;
    objc_msgSend(v4, "actionWithTitle:style:handler:", v6, 2, v15);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v8 = (void *)MEMORY[0x1E0DC3448];
    EventKitUIBundle();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "localizedStringForKey:value:table:", CFSTR("Cancel - subscribing to a spam calendar"), CFSTR("Cancel"), 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "actionWithTitle:style:handler:", v10, 1, 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    EventKitUIBundle();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "localizedStringForKey:value:table:", CFSTR("This subscribed calendar is spam. Are you sure you want to continue?"), &stru_1E601DFA8, 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0DC3450], "alertControllerWithTitle:message:preferredStyle:", v13, 0, 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "addAction:", v7);
    objc_msgSend(v14, "addAction:", v11);
    -[EKSubscribedCalendarEditor presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v14, 1, 0);

  }
  else
  {
    -[EKSubscribedCalendarEditor _validateUserEnteredURL](self, "_validateUserEnteredURL");
  }
}

uint64_t __43__EKSubscribedCalendarEditor__validateURL___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_validateUserEnteredURL");
}

- (void)_validateUserEnteredURL
{
  self->_insecureConnectionOffered = 0;
  self->_insecureConnectionApproved = 0;
  -[EKSubscribedCalendarEditor _validateURL](self, "_validateURL");
}

- (void)_validateURL
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  id v8;
  uint8_t buf[16];

  if (self->_insecureConnectionOffered && !self->_insecureConnectionApproved)
  {
    -[EKCalendarValidateEditItem setAnimateSpinner:](self->_validateItem, "setAnimateSpinner:", 0);
    -[EKSubscribedCalendarEditor setState:](self, "setState:", 2);
  }
  else
  {
    -[EKCalendarValidateEditItem setAnimateSpinner:](self->_validateItem, "setAnimateSpinner:", 1);
    v3 = (void *)MEMORY[0x1E0D0CE18];
    -[EKCalendarSubscriptionURLEditItem urlString](self->_urlItem, "urlString");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "checkSubscriptionURL:missingSchemeBlock:unsupportedSchemeBlock:", v4, 0, 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      objc_msgSend(MEMORY[0x1E0D0CE18], "subscriptionURL:usingHTTPS:", v5, !self->_insecureConnectionApproved);
      v8 = (id)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v8, "absoluteString");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[EKCalendarSubscriptionURLEditItem setUrlString:](self->_urlItem, "setUrlString:", v6);

      -[EKSubscribedCalendarEditor _kickoffPreviewDataFetch:](self, "_kickoffPreviewDataFetch:", v8);
    }
    else
    {
      v7 = kEKUILogHandle;
      if (os_log_type_enabled((os_log_t)kEKUILogHandle, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1AF84D000, v7, OS_LOG_TYPE_DEFAULT, "Local validation of subcal url failed, aborting add flow", buf, 2u);
      }
      -[EKCalendarValidateEditItem setAnimateSpinner:](self->_validateItem, "setAnimateSpinner:", 0);
      -[EKSubscribedCalendarEditor setState:](self, "setState:", 2);
    }
  }
}

- (void)_promptToContinueUsingInsecureConnection
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
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  _QWORD v18[5];
  _QWORD v19[5];

  self->_insecureConnectionOffered = 1;
  v3 = (void *)MEMORY[0x1E0DC3450];
  EventKitUIBundle();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("Insecure Connection"), &stru_1E601DFA8, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  EventKitUIBundle();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("The connection is not secure. Do you want to continue subscribing?"), &stru_1E601DFA8, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "alertControllerWithTitle:message:preferredStyle:", v5, v7, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = (void *)MEMORY[0x1E0DC3448];
  EventKitUIBundle();
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "localizedStringForKey:value:table:", CFSTR("Continue - insecure connection"), CFSTR("Continue"), 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = MEMORY[0x1E0C809B0];
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __70__EKSubscribedCalendarEditor__promptToContinueUsingInsecureConnection__block_invoke;
  v19[3] = &unk_1E60185C0;
  v19[4] = self;
  objc_msgSend(v9, "actionWithTitle:style:handler:", v11, 0, v19);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "addAction:", v13);
  v14 = (void *)MEMORY[0x1E0DC3448];
  EventKitUIBundle();
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "localizedStringForKey:value:table:", CFSTR("Cancel - insecure connection"), CFSTR("Cancel"), 0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = v12;
  v18[1] = 3221225472;
  v18[2] = __70__EKSubscribedCalendarEditor__promptToContinueUsingInsecureConnection__block_invoke_2;
  v18[3] = &unk_1E60185C0;
  v18[4] = self;
  objc_msgSend(v14, "actionWithTitle:style:handler:", v16, 1, v18);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "addAction:", v17);
  -[EKSubscribedCalendarEditor presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v8, 1, 0);

}

uint64_t __70__EKSubscribedCalendarEditor__promptToContinueUsingInsecureConnection__block_invoke(uint64_t a1)
{
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 1105) = 1;
  return objc_msgSend(*(id *)(a1 + 32), "_validateURL");
}

uint64_t __70__EKSubscribedCalendarEditor__promptToContinueUsingInsecureConnection__block_invoke_2(uint64_t a1)
{
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 1105) = 0;
  return objc_msgSend(*(id *)(a1 + 32), "_validateURL");
}

- (void)_kickoffPreviewDataFetch:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  id previewDownloadToken;
  id v8;

  v4 = (void *)MEMORY[0x1E0D1C3F8];
  v5 = a3;
  objc_msgSend(v4, "sharedConnection");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "downloadSubscribedCalendarWithURL:queue:delegate:", v5, MEMORY[0x1E0C80D38], self);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  previewDownloadToken = self->_previewDownloadToken;
  self->_previewDownloadToken = v6;

}

- (void)_cancelInFlightPreviewDataFetch
{
  id v3;

  if (self->_previewDownloadToken)
  {
    objc_msgSend(MEMORY[0x1E0D1C3F8], "sharedConnection");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "cancelDownloadingSubscriptionCalendarWithDownloadID:", self->_previewDownloadToken);

  }
}

- (void)calendarItemStartedEditing:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  if (-[EKSubscribedCalendarEditor state](self, "state", a3) == 3)
  {
    -[EKSubscribedCalendarEditor navigationItem](self, "navigationItem");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "leftBarButtonItem");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setEnabled:", 1);

    -[EKSubscribedCalendarEditor navigationItem](self, "navigationItem");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "rightBarButtonItem");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setEnabled:", 1);

  }
}

- (void)viewWillLayoutSubviews
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;
  CGRect v16;

  v15 = *MEMORY[0x1E0C80C00];
  if (self->_tableViewHeader && self->_allowTableHeaderLayouts)
    -[EKSubscribedCalendarEditor _updateTableHeaderLayout](self, "_updateTableHeaderLayout");
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  -[EKAbstractCalendarEditor editItems](self, "editItems", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v11;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v11 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v10 + 1) + 8 * i);
        -[EKSubscribedCalendarEditor view](self, "view");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "frame");
        objc_msgSend(v8, "layoutForWidth:", CGRectGetWidth(v16));

      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v5);
  }

}

- (CGSize)calculatePreferredContentSize
{
  double v2;
  double v3;
  objc_super v4;
  CGSize result;

  if (self->_holidayCalendarMode && !self->_state)
  {
    v2 = *MEMORY[0x1E0C9D820];
    v3 = *(double *)(MEMORY[0x1E0C9D820] + 8);
  }
  else
  {
    v4.receiver = self;
    v4.super_class = (Class)EKSubscribedCalendarEditor;
    -[EKAbstractCalendarEditor calculatePreferredContentSize](&v4, sel_calculatePreferredContentSize);
  }
  result.height = v3;
  result.width = v2;
  return result;
}

- (void)subscribedCalendarDidFinishLoading:(id)a3
{
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  uint64_t v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint8_t v24[16];

  v5 = a3;
  v6 = kEKUILogHandle;
  if (os_log_type_enabled((os_log_t)kEKUILogHandle, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v24 = 0;
    _os_log_impl(&dword_1AF84D000, v6, OS_LOG_TYPE_DEFAULT, "Successfully fetched subscribed calendar preview data", v24, 2u);
  }
  objc_storeStrong((id *)&self->_previewSummary, a3);
  -[DAESubscribedCalendarSummary title](self->_previewSummary, "title");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKAbstractCalendarEditor calendar](self, "calendar");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setTitle:", v7);

  -[DAESubscribedCalendarSummary color](self->_previewSummary, "color");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKAbstractCalendarEditor calendar](self, "calendar");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setColorStringRaw:", v9);

  -[DAESubscribedCalendarSummary notes](self->_previewSummary, "notes");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKAbstractCalendarEditor calendar](self, "calendar");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setNotes:", v11);

  -[DAESubscribedCalendarSummary refreshInterval](self->_previewSummary, "refreshInterval");
  if (v13 <= 0.0)
  {
    -[EKAbstractCalendarEditor calendar](self, "calendar");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = v16;
    v18 = 604800;
  }
  else
  {
    -[DAESubscribedCalendarSummary refreshInterval](self->_previewSummary, "refreshInterval");
    v15 = (int)v14;
    -[EKAbstractCalendarEditor calendar](self, "calendar");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = v16;
    v18 = v15;
  }
  objc_msgSend(v16, "setRefreshInterval:", v18);

  objc_msgSend(v5, "subscriptionID");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKAbstractCalendarEditor calendar](self, "calendar");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setSubscriptionID:", v19);

  objc_msgSend(v5, "subscriptionURL");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "absoluteString");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKAbstractCalendarEditor calendar](self, "calendar");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "setSubcalURL:", v22);

  -[EKCalendarValidateEditItem setAnimateSpinner:](self->_validateItem, "setAnimateSpinner:", 0);
  -[EKSubscribedCalendarEditor setState:](self, "setState:", 1);

}

- (void)subscribedCalendarFailedWithError:(id)a3
{
  id v4;
  NSObject *v5;
  id previewDownloadToken;
  int v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = kEKUILogHandle;
  if (os_log_type_enabled((os_log_t)kEKUILogHandle, OS_LOG_TYPE_ERROR))
  {
    v7 = 138412290;
    v8 = v4;
    _os_log_impl(&dword_1AF84D000, v5, OS_LOG_TYPE_ERROR, "Failed to fetch subscribed calendar preview data: %@", (uint8_t *)&v7, 0xCu);
  }
  previewDownloadToken = self->_previewDownloadToken;
  self->_previewDownloadToken = 0;

  if (self->_insecureConnectionOffered)
  {
    -[EKCalendarValidateEditItem setAnimateSpinner:](self->_validateItem, "setAnimateSpinner:", 0);
    -[EKSubscribedCalendarEditor setState:](self, "setState:", 2);
  }
  else
  {
    -[EKSubscribedCalendarEditor _promptToContinueUsingInsecureConnection](self, "_promptToContinueUsingInsecureConnection");
  }

}

- (void)subscribedCalendarRequiresPassword:(id)a3 withContinuation:(id)a4
{
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  id v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  _QWORD v25[5];
  id v26;
  _QWORD v27[5];
  id v28;
  id v29;
  uint8_t buf[16];

  v5 = a4;
  v6 = kEKUILogHandle;
  if (os_log_type_enabled((os_log_t)kEKUILogHandle, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1AF84D000, v6, OS_LOG_TYPE_DEFAULT, "Fetching subscribed calendar requires username and passwor", buf, 2u);
  }
  v7 = (void *)MEMORY[0x1E0DC3450];
  EventKitUIBundle();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("Authentication"), &stru_1E601DFA8, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  EventKitUIBundle();
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "localizedStringForKey:value:table:", CFSTR("You must enter a valid username and password to access this calendar."), &stru_1E601DFA8, 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "alertControllerWithTitle:message:preferredStyle:", v9, v11, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "addTextFieldWithConfigurationHandler:", &__block_literal_global_67);
  objc_msgSend(v12, "addTextFieldWithConfigurationHandler:", &__block_literal_global_105);
  v13 = (void *)MEMORY[0x1E0DC3448];
  EventKitUIBundle();
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "localizedStringForKey:value:table:", CFSTR("OK - subscription authentication"), CFSTR("OK"), 0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = MEMORY[0x1E0C809B0];
  v27[0] = MEMORY[0x1E0C809B0];
  v27[1] = 3221225472;
  v27[2] = __82__EKSubscribedCalendarEditor_subscribedCalendarRequiresPassword_withContinuation___block_invoke_3;
  v27[3] = &unk_1E601C9D8;
  v27[4] = self;
  v28 = v12;
  v17 = v5;
  v29 = v17;
  v18 = v12;
  objc_msgSend(v13, "actionWithTitle:style:handler:", v15, 0, v27);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v18, "addAction:", v19);
  v20 = (void *)MEMORY[0x1E0DC3448];
  EventKitUIBundle();
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "localizedStringForKey:value:table:", CFSTR("Cancel - subscription authentication"), CFSTR("Cancel"), 0);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v25[0] = v16;
  v25[1] = 3221225472;
  v25[2] = __82__EKSubscribedCalendarEditor_subscribedCalendarRequiresPassword_withContinuation___block_invoke_4;
  v25[3] = &unk_1E601B760;
  v25[4] = self;
  v26 = v17;
  v23 = v17;
  objc_msgSend(v20, "actionWithTitle:style:handler:", v22, 1, v25);
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v18, "addAction:", v24);
  -[EKSubscribedCalendarEditor presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v18, 1, 0);

}

void __82__EKSubscribedCalendarEditor_subscribedCalendarRequiresPassword_withContinuation___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  id v4;

  v4 = a2;
  EventKitUIBundle();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("Username"), &stru_1E601DFA8, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setPlaceholder:", v3);

  objc_msgSend(v4, "setTextContentType:", *MEMORY[0x1E0DC54A0]);
}

void __82__EKSubscribedCalendarEditor_subscribedCalendarRequiresPassword_withContinuation___block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  id v4;

  v4 = a2;
  EventKitUIBundle();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("Password"), &stru_1E601DFA8, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setPlaceholder:", v3);

  objc_msgSend(v4, "setTextContentType:", *MEMORY[0x1E0DC5468]);
}

uint64_t __82__EKSubscribedCalendarEditor_subscribedCalendarRequiresPassword_withContinuation___block_invoke_3(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;

  objc_msgSend(*(id *)(a1 + 40), "textFields");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectAtIndexedSubscript:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "text");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = *(_QWORD *)(a1 + 32);
  v6 = *(void **)(v5 + 1088);
  *(_QWORD *)(v5 + 1088) = v4;

  objc_msgSend(*(id *)(a1 + 40), "textFields");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectAtIndexedSubscript:", 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "text");
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = *(_QWORD *)(a1 + 32);
  v11 = *(void **)(v10 + 1096);
  *(_QWORD *)(v10 + 1096) = v9;

  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
}

uint64_t __82__EKSubscribedCalendarEditor_subscribedCalendarRequiresPassword_withContinuation___block_invoke_4(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  void *v5;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 1088);
  *(_QWORD *)(v2 + 1088) = 0;

  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(void **)(v4 + 1096);
  *(_QWORD *)(v4 + 1096) = 0;

  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (void)_startSpamCheckingURLString:(id)a3
{
  void *v4;
  int v5;
  void *v6;
  id v7;

  v7 = a3;
  if (_os_feature_enabled_impl())
  {
    objc_msgSend(MEMORY[0x1E0D0CDE0], "sharedPreferences");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "allowSubscribedCalendarSpamDetection");

    if (v5)
    {
      if (objc_msgSend(v7, "length"))
      {
        objc_msgSend(MEMORY[0x1E0D0CE18], "checkSubscriptionURL:missingSchemeBlock:unsupportedSchemeBlock:", v7, 0, 0);
        v6 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v6 = 0;
      }
      -[EKCalendarSubscriptionSpamCheckEditItem setURLToCheck:](self->_spamCheckItem, "setURLToCheck:", v6);
      -[EKCalendarValidateEditItem setURLIsSpam:](self->_validateItem, "setURLIsSpam:", 0);
      -[EKSubscribedCalendarEditor _updateCancelButtonVisibilityForSpamStatus:](self, "_updateCancelButtonVisibilityForSpamStatus:", 0);

    }
  }

}

- (void)URLEditItemDidChangeURLString:(id)a3
{
  id v4;

  objc_msgSend(a3, "urlString");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[EKSubscribedCalendarEditor _startSpamCheckingURLString:](self, "_startSpamCheckingURLString:", v4);

}

- (void)calendarSubscriptionSpamCheckEditItem:(id)a3 didDetermineThatURL:(id)a4 isSpam:(BOOL)a5
{
  _BOOL8 v5;

  v5 = a5;
  -[EKCalendarValidateEditItem setURLIsSpam:](self->_validateItem, "setURLIsSpam:", a5, a4);
  -[EKSubscribedCalendarEditor _updateCancelButtonVisibilityForSpamStatus:](self, "_updateCancelButtonVisibilityForSpamStatus:", v5);
}

- (void)_updateCancelButtonVisibilityForSpamStatus:(BOOL)a3
{
  _BOOL4 v3;
  id v5;

  v3 = a3;
  if (-[EKCalendarCancelValidationEditItem hidden](self->_cancelValidationItem, "hidden") == a3)
  {
    -[EKCalendarCancelValidationEditItem setHidden:](self->_cancelValidationItem, "setHidden:", !v3);
    -[EKSubscribedCalendarEditor tableView](self, "tableView");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "reloadData");

  }
}

- (void)_showPrivacyNotice
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
  id v15;

  EventKitUIBundle();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("Subscribed Calendar Spam Protection"), &stru_1E601DFA8, 0);
  v15 = (id)objc_claimAutoreleasedReturnValue();

  EventKitUIBundle();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("Calendar can check whether a subscribed calendar is spam before you add it. In order to do this, Calendar will send the URL of the subscribed calendar to Apple for checking. You can change this in Settings."), &stru_1E601DFA8, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D651B8]), "initWithTitle:detailText:icon:", v15, v5, 0);
  objc_msgSend(MEMORY[0x1E0D65140], "boldButton");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  EventKitUIBundle();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("Enable"), &stru_1E601DFA8, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setTitle:forState:", v9, 0);

  objc_msgSend(v7, "addTarget:action:forControlEvents:", self, sel__allowButtonTapped, 64);
  objc_msgSend(MEMORY[0x1E0D65170], "linkButton");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  EventKitUIBundle();
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "localizedStringForKey:value:table:", CFSTR("Disable"), &stru_1E601DFA8, 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setTitle:forState:", v12, 0);

  objc_msgSend(v10, "addTarget:action:forControlEvents:", self, sel__denyButtonTapped, 64);
  objc_msgSend(v6, "buttonTray");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "addButton:", v7);

  objc_msgSend(v6, "buttonTray");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "addButton:", v10);

  -[EKSubscribedCalendarEditor presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v6, 1, 0);
}

- (void)_allowButtonTapped
{
  void *v2;
  id v3;

  -[EKSubscribedCalendarEditor dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, 0);
  objc_msgSend(MEMORY[0x1E0D0CDE0], "sharedPreferences");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setAllowSubscribedCalendarSpamDetection:", 1);

  objc_msgSend(MEMORY[0x1E0D0CDE0], "sharedPreferences");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setDisplayedSubscribedCalendarSpamDetectionPrivacyNotice:", 1);

}

- (void)_denyButtonTapped
{
  void *v2;
  id v3;

  -[EKSubscribedCalendarEditor dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, 0);
  objc_msgSend(MEMORY[0x1E0D0CDE0], "sharedPreferences");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setAllowSubscribedCalendarSpamDetection:", 0);

  objc_msgSend(MEMORY[0x1E0D0CDE0], "sharedPreferences");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setDisplayedSubscribedCalendarSpamDetectionPrivacyNotice:", 1);

}

- (NSURL)prefillURL
{
  return self->_prefillURL;
}

- (void)setPrefillURL:(id)a3
{
  objc_storeStrong((id *)&self->_prefillURL, a3);
}

- (unint64_t)state
{
  return self->_state;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_prefillURL, 0);
  objc_storeStrong((id *)&self->_subCalManager, 0);
  objc_storeStrong((id *)&self->_previewSummary, 0);
  objc_storeStrong(&self->_previewDownloadToken, 0);
  objc_storeStrong((id *)&self->_spamCheckItem, 0);
  objc_storeStrong((id *)&self->_cancelValidationItem, 0);
  objc_storeStrong((id *)&self->_validateItem, 0);
  objc_storeStrong((id *)&self->_urlItem, 0);
  objc_storeStrong((id *)&self->_colorEditItem, 0);
  objc_storeStrong((id *)&self->_preloadTitle, 0);
  objc_storeStrong((id *)&self->_password, 0);
  objc_storeStrong((id *)&self->_username, 0);
  objc_storeStrong((id *)&self->_tableViewHeader, 0);
  objc_storeStrong((id *)&self->_limitedToSource, 0);
}

@end
