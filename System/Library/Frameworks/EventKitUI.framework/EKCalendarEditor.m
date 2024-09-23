@implementation EKCalendarEditor

+ (id)newFamilyCalendarEditorWithEventStore:(id)a3
{
  id v3;
  void *v4;
  EKCalendarEditor *v5;
  void *v6;
  void *v7;
  void *v8;
  EKCalendarEditor *v9;
  _QWORD v11[4];
  EKCalendarEditor *v12;

  v3 = a3;
  objc_msgSend(v3, "primaryAppleAccountSource");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[EKCalendarEditor initWithCalendar:eventStore:entityType:limitedToSource:]([EKCalendarEditor alloc], "initWithCalendar:eventStore:entityType:limitedToSource:", 0, v3, 0, v4);

  -[EKCalendarEditor setIsNewFamilyCalendar:](v5, "setIsNewFamilyCalendar:", 1);
  EventKitUIBundle();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("Family Calendar"), &stru_1E601DFA8, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKCalendarEditor setPrefillCalendarTitle:](v5, "setPrefillCalendarTitle:", v7);

  v8 = (void *)MEMORY[0x1E0CAA090];
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __58__EKCalendarEditor_newFamilyCalendarEditorWithEventStore___block_invoke;
  v11[3] = &unk_1E6019D80;
  v9 = v5;
  v12 = v9;
  objc_msgSend(v8, "requestFamilyShareesWithCompletion:", v11);

  return v9;
}

void __58__EKCalendarEditor_newFamilyCalendarEditorWithEventStore___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  void *v5;
  id v6;

  v5 = *(void **)(a1 + 32);
  v6 = a3;
  objc_msgSend(v5, "setInitialSharees:", a2);
  objc_msgSend(*(id *)(a1 + 32), "setMeSharee:", v6);

}

- (EKCalendarEditor)initWithCalendar:(id)a3 eventStore:(id)a4 entityType:(unint64_t)a5 limitedToSource:(id)a6
{
  id v10;
  id v11;
  id v12;
  EKCalendarEditor *v13;
  EKCalendarEditor *v14;
  void *v15;
  id v16;
  _QWORD v18[4];
  id v19;
  id location;
  objc_super v21;
  _QWORD v22[2];

  v22[1] = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a6;
  v21.receiver = self;
  v21.super_class = (Class)EKCalendarEditor;
  v13 = -[EKAbstractCalendarEditor initWithCalendar:eventStore:entityType:limitedToSource:](&v21, sel_initWithCalendar_eventStore_entityType_limitedToSource_, v10, v11, a5, v12);
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_limitedToSource, a6);
    v14->_entityType = a5;
    objc_initWeak(&location, v14);
    v22[0] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v22, 1);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __75__EKCalendarEditor_initWithCalendar_eventStore_entityType_limitedToSource___block_invoke;
    v18[3] = &unk_1E6018610;
    objc_copyWeak(&v19, &location);
    v16 = (id)-[EKCalendarEditor registerForTraitChanges:withHandler:](v14, "registerForTraitChanges:withHandler:", v15, v18);

    objc_destroyWeak(&v19);
    objc_destroyWeak(&location);
  }

  return v14;
}

void __75__EKCalendarEditor_initWithCalendar_eventStore_entityType_limitedToSource___block_invoke(uint64_t a1)
{
  id *WeakRetained;
  void *v2;
  id *v3;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v3 = WeakRetained;
    objc_msgSend(WeakRetained[138], "reset");
    objc_msgSend(v3, "tableView");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "reloadData");

    WeakRetained = v3;
  }

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

  v3 = -[EKAbstractCalendarEditor isNewCalendar](self, "isNewCalendar");
  EventKitUIBundle();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3)
  {
    v6 = CFSTR("Add Calendar Title");
    v7 = CFSTR("Add Calendar");
  }
  else
  {
    v6 = CFSTR("Edit Calendar");
    v7 = &stru_1E601DFA8;
  }
  objc_msgSend(v4, "localizedStringForKey:value:table:", v6, v7, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKCalendarEditor setTitle:](self, "setTitle:", v8);

  v9.receiver = self;
  v9.super_class = (Class)EKCalendarEditor;
  -[EKAbstractCalendarEditor loadView](&v9, sel_loadView);
}

- (void)viewDidLoad
{
  void *v3;
  uint64_t v4;
  _BOOL4 v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)EKCalendarEditor;
  -[EKAbstractCalendarEditor viewDidLoad](&v11, sel_viewDidLoad);
  -[EKCalendarEditor prefillCalendarTitle](self, "prefillCalendarTitle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "length");

  v5 = -[EKAbstractCalendarEditor enableDoneInitially](self, "enableDoneInitially");
  -[EKCalendarEditor navigationItem](self, "navigationItem");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v4)
  {
    if (v5)
      objc_msgSend(v6, "leftBarButtonItem");
    else
      objc_msgSend(v6, "rightBarButtonItem");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    v10 = 1;
  }
  else
  {
    if (v5)
      objc_msgSend(v6, "leftBarButtonItem");
    else
      objc_msgSend(v6, "rightBarButtonItem");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    v10 = 0;
  }
  objc_msgSend(v8, "setEnabled:", v10);

  -[EKCalendarEditor _updateAppEntityAnnotationsIfNeeded](self, "_updateAppEntityAnnotationsIfNeeded");
}

- (void)_updateAppEntityAnnotationsIfNeeded
{
  void *v3;
  void *v4;
  id v5;

  -[EKAbstractCalendarEditor calendar](self, "calendar");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  if (CalendarLinkLibraryCore() && v5 && (objc_msgSend(v5, "isNew") & 1) == 0)
  {
    -[EKCalendarEditor view](self, "view");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "Cal_annotateWithCalendar:", v5);

    -[EKCalendarEditor view](self, "view");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "Cal_updateEntityAnnotationStateIsSelected:isHighlighted:isFocused:isDisabled:isEditing:isPrimary:", 1, 0, 0, 0, 1, 1);

  }
}

- (void)viewDidAppear:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  NSObject *v6;
  objc_class *v7;
  void *v8;
  void *v9;
  void *v10;
  objc_super v11;
  uint8_t buf[4];
  void *v13;
  __int16 v14;
  _BOOL4 v15;
  uint64_t v16;

  v3 = a3;
  v16 = *MEMORY[0x1E0C80C00];
  v5 = (void *)kEKUILogHandle;
  if (os_log_type_enabled((os_log_t)kEKUILogHandle, OS_LOG_TYPE_INFO))
  {
    v6 = v5;
    v7 = (objc_class *)objc_opt_class();
    NSStringFromClass(v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v13 = v8;
    v14 = 1024;
    v15 = -[EKAbstractCalendarEditor isNewCalendar](self, "isNewCalendar");
    _os_log_impl(&dword_1AF84D000, v6, OS_LOG_TYPE_INFO, "[UserStateLog] State -> %{public}@ viewDidAppear. isNew = %d", buf, 0x12u);

  }
  if (-[EKAbstractCalendarEditor isNewCalendar](self, "isNewCalendar")
    && !-[EKCalendarEditor isNewFamilyCalendar](self, "isNewFamilyCalendar"))
  {
    -[EKAbstractCalendarEditor editItems](self, "editItems");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectAtIndex:", 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "becomeFirstResponder");

  }
  v11.receiver = self;
  v11.super_class = (Class)EKCalendarEditor;
  -[EKCalendarEditor viewDidAppear:](&v11, sel_viewDidAppear_, v3);
}

- (void)contentSizeCategoryDidChangeNotification:(id)a3
{
  id v4;

  -[EKCalendarColorEditItem reset](self->_colorEditItem, "reset", a3);
  -[EKCalendarEditor tableView](self, "tableView");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "reloadData");

}

- (id)loadEditItems
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  EKCalendarTitleEditItem *v9;
  EKCalendarTitleEditItem *titleItem;
  uint64_t v11;
  void *v12;
  void *v13;
  char v14;
  void *v15;
  EKCalendarAccountEditItem *v16;
  EKCalendarAccountEditItem *accountItem;
  EKCalendarShareesEditItem *v18;
  EKCalendarShareesEditItem *shareesEditItem;
  EKCalendarIgnoreSharedCalendarResourceChangeNotificationsEditItem *v20;
  EKCalendarIgnoreSharedCalendarResourceChangeNotificationsEditItem *ignoreSharedResourceChangeNotificationsItem;
  EKCalendarColorEditItem *v22;
  EKCalendarColorEditItem *colorEditItem;
  EKCalendarIgnoreAlertsEditItem *v24;
  EKCalendarIgnoreAlertsEditItem *ignoreAlertsItem;
  EKCalendarIsAffectingAvailabilityEditItem *v26;
  EKCalendarIsAffectingAvailabilityEditItem *affectsAvailabilityItem;
  EKCalendarPublishingEditItem *v28;
  EKCalendarPublishingEditItem *publishItem;
  EKCalendarDeleteButtonEditItem *v30;
  EKCalendarDeleteButtonEditItem *deleteItem;
  EKCalendarDeleteButtonEditItem *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;

  -[EKAbstractCalendarEditor calendar](self, "calendar");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "source");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
    -[EKCalendarEditor fetchInitialSource](self, "fetchInitialSource");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKAbstractCalendarEditor calendar](self, "calendar");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setSource:", v5);

  }
  -[EKAbstractCalendarEditor calendar](self, "calendar");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "source");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKCalendarEditor updateShouldSuggestFamilyShareesWithSource:](self, "updateShouldSuggestFamilyShareesWithSource:", v8);

  v9 = objc_alloc_init(EKCalendarTitleEditItem);
  titleItem = self->_titleItem;
  self->_titleItem = v9;

  -[EKCalendarEditor prefillCalendarTitle](self, "prefillCalendarTitle");
  v11 = objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    v12 = (void *)v11;
    -[EKCalendarEditor prefillCalendarTitle](self, "prefillCalendarTitle");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "isEqual:", &stru_1E601DFA8);

    if ((v14 & 1) == 0)
    {
      -[EKCalendarEditor prefillCalendarTitle](self, "prefillCalendarTitle");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[EKCalendarTitleEditItem setPrefillTitle:](self->_titleItem, "setPrefillTitle:", v15);

    }
  }
  v16 = -[EKCalendarAccountEditItem initLimitedToSource:]([EKCalendarAccountEditItem alloc], "initLimitedToSource:", self->_limitedToSource);
  accountItem = self->_accountItem;
  self->_accountItem = v16;

  -[EKCalendarAccountEditItem setEditable:](self->_accountItem, "setEditable:", 1);
  v18 = objc_alloc_init(EKCalendarShareesEditItem);
  shareesEditItem = self->_shareesEditItem;
  self->_shareesEditItem = v18;

  v20 = objc_alloc_init(EKCalendarIgnoreSharedCalendarResourceChangeNotificationsEditItem);
  ignoreSharedResourceChangeNotificationsItem = self->_ignoreSharedResourceChangeNotificationsItem;
  self->_ignoreSharedResourceChangeNotificationsItem = v20;

  v22 = objc_alloc_init(EKCalendarColorEditItem);
  colorEditItem = self->_colorEditItem;
  self->_colorEditItem = v22;

  -[EKCalendarColorEditItem setLayoutInline:](self->_colorEditItem, "setLayoutInline:", 0);
  v24 = objc_alloc_init(EKCalendarIgnoreAlertsEditItem);
  ignoreAlertsItem = self->_ignoreAlertsItem;
  self->_ignoreAlertsItem = v24;

  v26 = objc_alloc_init(EKCalendarIsAffectingAvailabilityEditItem);
  affectsAvailabilityItem = self->_affectsAvailabilityItem;
  self->_affectsAvailabilityItem = v26;

  v28 = objc_alloc_init(EKCalendarPublishingEditItem);
  publishItem = self->_publishItem;
  self->_publishItem = v28;

  v30 = objc_alloc_init(EKCalendarDeleteButtonEditItem);
  deleteItem = self->_deleteItem;
  self->_deleteItem = v30;

  -[EKCalendarButtonEditItem setButtonTarget:action:](self->_deleteItem, "setButtonTarget:action:", self, sel__deleteClicked_);
  v32 = self->_deleteItem;
  EventKitUIBundle();
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "localizedStringForKey:value:table:", CFSTR("Delete Calendar"), &stru_1E601DFA8, 0);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKCalendarButtonEditItem setButtonTitle:](v32, "setButtonTitle:", v34);

  -[EKAbstractCalendarEditor calendar](self, "calendar");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "source");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKCalendarEditor updateShouldSuggestFamilyShareesWithSource:](self, "updateShouldSuggestFamilyShareesWithSource:", v36);

  return -[EKCalendarEditor reconfiguredEditItems](self, "reconfiguredEditItems");
}

- (id)reconfiguredEditItems
{
  void *v3;
  int v4;
  EKCalendarAccountEditItem *accountItem;
  EKCalendarIgnoreAlertsEditItem *ignoreAlertsItem;
  EKCalendarDeleteButtonEditItem *deleteItem;
  void *v8;
  _QWORD *v9;
  uint64_t v10;
  EKCalendarAccountEditItem *v11;
  EKCalendarIgnoreSharedCalendarResourceChangeNotificationsEditItem *ignoreSharedResourceChangeNotificationsItem;
  EKCalendarIgnoreAlertsEditItem *v13;
  EKCalendarDeleteButtonEditItem *v14;
  EKCalendarShareesEditItem *shareesEditItem;
  EKCalendarColorEditItem *colorEditItem;
  EKCalendarIsAffectingAvailabilityEditItem *affectsAvailabilityItem;
  EKCalendarDeleteButtonEditItem *v18;
  void *v19;
  void *v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t i;
  void *v26;
  void *v27;
  void *v28;
  int v29;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _BYTE v35[128];
  _QWORD v36[8];
  _QWORD v37[8];
  _QWORD v38[8];

  v38[6] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0D0CD78], "shared");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isCurrentProcessAnApplicationExtension");

  if (v4)
  {
    accountItem = self->_accountItem;
    v38[0] = self->_titleItem;
    v38[1] = accountItem;
    ignoreAlertsItem = self->_ignoreAlertsItem;
    v38[2] = self->_colorEditItem;
    v38[3] = ignoreAlertsItem;
    deleteItem = self->_deleteItem;
    v38[4] = self->_affectsAvailabilityItem;
    v38[5] = deleteItem;
    v8 = (void *)MEMORY[0x1E0C99D20];
    v9 = v38;
    v10 = 6;
  }
  else
  {
    if (-[EKAbstractCalendarEditor isNewCalendar](self, "isNewCalendar"))
    {
      v11 = self->_accountItem;
      v37[0] = self->_titleItem;
      v37[1] = v11;
      ignoreSharedResourceChangeNotificationsItem = self->_ignoreSharedResourceChangeNotificationsItem;
      v37[2] = self->_shareesEditItem;
      v37[3] = ignoreSharedResourceChangeNotificationsItem;
      v13 = self->_ignoreAlertsItem;
      v37[4] = self->_colorEditItem;
      v37[5] = v13;
      v14 = self->_deleteItem;
      v37[6] = self->_affectsAvailabilityItem;
      v37[7] = v14;
      v8 = (void *)MEMORY[0x1E0C99D20];
      v9 = v37;
    }
    else
    {
      shareesEditItem = self->_shareesEditItem;
      v36[0] = self->_titleItem;
      v36[1] = shareesEditItem;
      colorEditItem = self->_colorEditItem;
      v36[2] = self->_ignoreSharedResourceChangeNotificationsItem;
      v36[3] = colorEditItem;
      affectsAvailabilityItem = self->_affectsAvailabilityItem;
      v36[4] = self->_ignoreAlertsItem;
      v36[5] = affectsAvailabilityItem;
      v18 = self->_deleteItem;
      v36[6] = self->_publishItem;
      v36[7] = v18;
      v8 = (void *)MEMORY[0x1E0C99D20];
      v9 = v36;
    }
    v10 = 8;
  }
  objc_msgSend(v8, "arrayWithObjects:count:", v9, v10);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v19, "count"));
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  v21 = v19;
  v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
  if (v22)
  {
    v23 = v22;
    v24 = *(_QWORD *)v32;
    do
    {
      for (i = 0; i != v23; ++i)
      {
        if (*(_QWORD *)v32 != v24)
          objc_enumerationMutation(v21);
        v26 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * i);
        -[EKAbstractCalendarEditor calendar](self, "calendar", (_QWORD)v31);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        -[EKAbstractCalendarEditor eventStore](self, "eventStore");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        v29 = objc_msgSend(v26, "configureWithCalendar:store:", v27, v28);

        if (v29)
          objc_msgSend(v20, "addObject:", v26);
      }
      v23 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
    }
    while (v23);
  }

  return v20;
}

- (id)fetchInitialSource
{
  EKSource *limitedToSource;
  void *v4;
  void *v5;
  void *v6;

  limitedToSource = self->_limitedToSource;
  -[EKAbstractCalendarEditor calendar](self, "calendar");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKAbstractCalendarEditor eventStore](self, "eventStore");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[EKCalendarEditor fetchInitialSourceWithLimitedToSource:calendar:store:](EKCalendarEditor, "fetchInitialSourceWithLimitedToSource:calendar:store:", limitedToSource, v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)fetchInitialSourceWithLimitedToSource:(id)a3 calendar:(id)a4 store:(id)a5
{
  id v7;
  id v8;
  id v9;
  id v10;
  void *v11;
  uint64_t v12;
  void *i;
  void *v14;
  void *v15;
  uint64_t v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = a5;
  objc_msgSend(v8, "source");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  if (!v10)
  {
    if (v7)
    {
      v10 = v7;
    }
    else
    {
      v20 = 0u;
      v21 = 0u;
      v18 = 0u;
      v19 = 0u;
      objc_msgSend(v9, "sources", 0);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = (id)objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      if (v10)
      {
        v12 = *(_QWORD *)v19;
        while (2)
        {
          for (i = 0; i != v10; i = (char *)i + 1)
          {
            if (*(_QWORD *)v19 != v12)
              objc_enumerationMutation(v11);
            v14 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * (_QWORD)i);
            if (objc_msgSend(v8, "isSubscribed"))
            {
              if ((objc_msgSend(v14, "isDelegate") & 1) == 0)
              {
                objc_msgSend(v14, "constraints");
                v15 = (void *)objc_claimAutoreleasedReturnValue();
                if (objc_msgSend(v15, "supportsSubscribedCalendars"))
                {

LABEL_21:
                  v10 = v14;
                  goto LABEL_22;
                }
                v16 = objc_msgSend(v14, "sourceType");

                if (v16 == 4)
                  goto LABEL_21;
              }
            }
            else if (objc_msgSend(v14, "supportsCalendarCreation")
                   && objc_msgSend(v14, "sourceType") != 4
                   && !objc_msgSend(v14, "isDelegate"))
            {
              goto LABEL_21;
            }
          }
          v10 = (id)objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
          if (v10)
            continue;
          break;
        }
      }
LABEL_22:

    }
  }

  return v10;
}

- (void)addNewSharees:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v12;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v4);
        v9 = *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * v8);
        -[EKAbstractCalendarEditor calendar](self, "calendar");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "addSharee:", v9);

        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v6);
  }
  -[EKAbstractCalendarEditor reconfigureAndReloadEditItems](self, "reconfigureAndReloadEditItems");

}

- (id)newSharees
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_opt_new();
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  -[EKAbstractCalendarEditor calendar](self, "calendar", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "sharees");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * i);
        if (objc_msgSend(v10, "isNew"))
          objc_msgSend(v3, "addObject:", v10);
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v7);
  }

  return v3;
}

- (id)existingSharees
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_opt_new();
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  -[EKAbstractCalendarEditor calendar](self, "calendar", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "sharees");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * i);
        if ((objc_msgSend(v10, "isNew") & 1) == 0)
          objc_msgSend(v3, "addObject:", v10);
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v7);
  }

  return v3;
}

- (void)setMeSharee:(id)a3
{
  id v5;
  void *v6;
  id v7;

  objc_storeStrong((id *)&self->_meSharee, a3);
  v5 = a3;
  -[EKCalendarShareesEditItem setMeSharee:](self->_shareesEditItem, "setMeSharee:", v5);

  -[EKAbstractCalendarEditor calendar](self, "calendar");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "source");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKCalendarEditor updateShouldSuggestFamilyShareesWithSource:](self, "updateShouldSuggestFamilyShareesWithSource:", v6);

}

- (void)updateShouldSuggestFamilyShareesWithSource:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v4 = a3;
  -[EKAbstractCalendarEditor eventStore](self, "eventStore");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "primaryAppleAccountSource");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isEqual:", v4);

  -[EKCalendarShareesEditItem setShouldSuggestFamilySharees:](self->_shareesEditItem, "setShouldSuggestFamilySharees:", v7);
}

- (void)_deleteCalendar
{
  void *v3;
  NSObject *v4;
  void *v5;
  unint64_t entityType;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  NSObject *v20;
  void *v21;
  NSObject *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  char v29;
  void *v30;
  void *v31;
  void *v32;
  _QWORD v33[5];
  _QWORD v34[4];
  id v35;
  EKCalendarEditor *v36;
  uint8_t buf[4];
  void *v38;
  __int16 v39;
  void *v40;
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v3 = (void *)kEKUILogHandle;
  if (os_log_type_enabled((os_log_t)kEKUILogHandle, OS_LOG_TYPE_DEFAULT))
  {
    v4 = v3;
    -[EKAbstractCalendarEditor calendar](self, "calendar");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v38 = v5;
    _os_log_impl(&dword_1AF84D000, v4, OS_LOG_TYPE_DEFAULT, "Deleting Calendar %@", buf, 0xCu);

  }
  entityType = self->_entityType;
  if (entityType)
    v7 = 2 * (entityType == 1);
  else
    v7 = 1;
  objc_msgSend(MEMORY[0x1E0CAA068], "sharedInstance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKAbstractCalendarEditor calendar](self, "calendar");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "removeInteractionsForCalendar:", v9);

  -[EKAbstractCalendarEditor calendar](self, "calendar");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "isSubscribed");
  v12 = MEMORY[0x1E0C809B0];
  if (!v11)
    goto LABEL_15;
  -[EKAbstractCalendarEditor calendar](self, "calendar");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "source");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "sourceType");

  if (v15 != 2)
  {
    -[EKAbstractCalendarEditor calendar](self, "calendar");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "subcalAccountID");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    v17 = objc_alloc_init(MEMORY[0x1E0C8F2B8]);
    objc_msgSend(v17, "accountWithIdentifier:", v10);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = (void *)kEKUILogHandle;
    if (v18)
    {
      if (os_log_type_enabled((os_log_t)kEKUILogHandle, OS_LOG_TYPE_INFO))
      {
        v20 = v19;
        -[EKAbstractCalendarEditor calendar](self, "calendar");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v38 = v10;
        v39 = 2112;
        v40 = v21;
        _os_log_impl(&dword_1AF84D000, v20, OS_LOG_TYPE_INFO, "Deleting account %{public}@ to delete subscribed calendar %@", buf, 0x16u);

      }
      v34[0] = v12;
      v34[1] = 3221225472;
      v34[2] = __35__EKCalendarEditor__deleteCalendar__block_invoke;
      v34[3] = &unk_1E601A8A0;
      v35 = v10;
      v36 = self;
      objc_msgSend(v17, "removeAccount:withCompletionHandler:", v18, v34);

    }
    else if (os_log_type_enabled((os_log_t)kEKUILogHandle, OS_LOG_TYPE_ERROR))
    {
      v22 = v19;
      -[EKAbstractCalendarEditor calendar](self, "calendar");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v38 = v10;
      v39 = 2112;
      v40 = v23;
      _os_log_impl(&dword_1AF84D000, v22, OS_LOG_TYPE_ERROR, "Couldn't find account with ID %{public}@ to remove while deleting subscribed calendar %@", buf, 0x16u);

    }
LABEL_15:

  }
  -[UIResponder EKUI_editor](self, "EKUI_editor");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKAbstractCalendarEditor calendar](self, "calendar");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "deleteCalendar:forEntityType:", v25, v7);

  -[EKAbstractCalendarEditor delegate](self, "delegate");
  v26 = objc_claimAutoreleasedReturnValue();
  if (v26)
  {
    v27 = (void *)v26;
    -[EKAbstractCalendarEditor delegate](self, "delegate");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = objc_opt_respondsToSelector();

    if ((v29 & 1) != 0)
    {
      -[EKAbstractCalendarEditor delegate](self, "delegate");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "calendarEditor:didCompleteWithAction:", self, 2);

    }
  }
  v31 = (void *)MEMORY[0x1E0CAA090];
  -[EKAbstractCalendarEditor calendar](self, "calendar");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v33[0] = v12;
  v33[1] = 3221225472;
  v33[2] = __35__EKCalendarEditor__deleteCalendar__block_invoke_47;
  v33[3] = &unk_1E6018638;
  v33[4] = self;
  objc_msgSend(v31, "isFamilyCalendar:completion:", v32, v33);

}

void __35__EKCalendarEditor__deleteCalendar__block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  NSObject *v9;
  void *v10;
  const char *v11;
  NSObject *v12;
  os_log_type_t v13;
  uint32_t v14;
  void *v15;
  uint64_t v16;
  int v17;
  uint64_t v18;
  __int16 v19;
  void *v20;
  __int16 v21;
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = (void *)kEKUILogHandle;
  if ((a2 & 1) != 0)
  {
    if (os_log_type_enabled((os_log_t)kEKUILogHandle, OS_LOG_TYPE_INFO))
    {
      v8 = *(_QWORD *)(a1 + 32);
      v7 = *(void **)(a1 + 40);
      v9 = v6;
      objc_msgSend(v7, "calendar");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = 138543618;
      v18 = v8;
      v19 = 2112;
      v20 = v10;
      v11 = "Successfully removed account %{public}@ for delete of subscribed calendar %@";
      v12 = v9;
      v13 = OS_LOG_TYPE_INFO;
      v14 = 22;
LABEL_6:
      _os_log_impl(&dword_1AF84D000, v12, v13, v11, (uint8_t *)&v17, v14);

    }
  }
  else if (os_log_type_enabled((os_log_t)kEKUILogHandle, OS_LOG_TYPE_ERROR))
  {
    v16 = *(_QWORD *)(a1 + 32);
    v15 = *(void **)(a1 + 40);
    v9 = v6;
    objc_msgSend(v15, "calendar");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = 138543874;
    v18 = v16;
    v19 = 2112;
    v20 = v10;
    v21 = 2112;
    v22 = v5;
    v11 = "Failed to remove account %{public}@ while deleting subscribed calendar %@: %@";
    v12 = v9;
    v13 = OS_LOG_TYPE_ERROR;
    v14 = 32;
    goto LABEL_6;
  }

}

void __35__EKCalendarEditor__deleteCalendar__block_invoke_47(uint64_t a1, int a2)
{
  void *v3;
  void *v4;
  NSObject *v5;
  void *v6;
  __CFNotificationCenter *DarwinNotifyCenter;
  int v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  if (a2)
  {
    v3 = (void *)kEKUILogHandle;
    if (os_log_type_enabled((os_log_t)kEKUILogHandle, OS_LOG_TYPE_DEFAULT))
    {
      v4 = *(void **)(a1 + 32);
      v5 = v3;
      objc_msgSend(v4, "calendar");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = 138412290;
      v9 = v6;
      _os_log_impl(&dword_1AF84D000, v5, OS_LOG_TYPE_DEFAULT, "Sending out delete family calendar darwin notification. %@", (uint8_t *)&v8, 0xCu);

    }
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterPostNotification(DarwinNotifyCenter, (CFNotificationName)*MEMORY[0x1E0CA9F98], 0, 0, 1u);
  }
}

- (void)_deleteClicked:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  const __CFString *v11;
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
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  void *v33;
  void *v34;
  _QWORD v35[5];

  v5 = a3;
  -[EKAbstractCalendarEditor calendar](self, "calendar");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("EKCalendarEditor.m"), 356, CFSTR("-[EKCalendarEditor _deleteClicked]: There is no calendar to delete."));

  }
  -[EKAbstractCalendarEditor calendar](self, "calendar");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "allowedEntityTypes");

  switch(v8)
  {
    case 1:
      EventKitUIBundle();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = v9;
      v11 = CFSTR("Are you sure you want to delete this calendar? All events associated with the calendar will also be deleted.");
      break;
    case 2:
      EventKitUIBundle();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = v9;
      v11 = CFSTR("Are you sure you want to delete this calendar? All reminders associated with the calendar will also be deleted.");
      break;
    case 3:
      EventKitUIBundle();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = v9;
      v11 = CFSTR("Are you sure you want to delete this calendar? All events and reminders associated with the calendar will also be deleted.");
      break;
    default:
      v12 = 0;
      goto LABEL_11;
  }
  objc_msgSend(v9, "localizedStringForKey:value:table:", v11, &stru_1E601DFA8, 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_11:
  objc_msgSend(MEMORY[0x1E0DC3450], "alertControllerWithTitle:message:preferredStyle:", v12, 0, 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)MEMORY[0x1E0DC3448];
  EventKitUIBundle();
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "localizedStringForKey:value:table:", CFSTR("Delete Calendar"), &stru_1E601DFA8, 0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v35[0] = MEMORY[0x1E0C809B0];
  v35[1] = 3221225472;
  v35[2] = __35__EKCalendarEditor__deleteClicked___block_invoke;
  v35[3] = &unk_1E60185C0;
  v35[4] = self;
  objc_msgSend(v14, "actionWithTitle:style:handler:", v16, 2, v35);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "addAction:", v17);

  v18 = (void *)MEMORY[0x1E0DC3448];
  EventKitUIBundle();
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "localizedStringForKey:value:table:", CFSTR("Cancel - delete clicked"), CFSTR("Cancel"), 0);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "actionWithTitle:style:handler:", v20, 1, 0);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "addAction:", v21);

  objc_msgSend(v5, "buttonView");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "popoverPresentationController");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "setSourceView:", v22);

  objc_msgSend(v5, "buttonView");
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v24, "bounds");
  v26 = v25;
  v28 = v27;
  v30 = v29;
  v32 = v31;
  objc_msgSend(v13, "popoverPresentationController");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "setSourceRect:", v26, v28, v30, v32);

  -[EKCalendarEditor presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v13, 1, 0);
}

uint64_t __35__EKCalendarEditor__deleteClicked___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_deleteCalendar");
}

- (void)calendarItemStartedEditing:(id)a3
{
  _BOOL4 v4;
  void *v5;
  void *v6;
  id v7;

  v4 = -[EKAbstractCalendarEditor enableDoneInitially](self, "enableDoneInitially", a3);
  -[EKCalendarEditor navigationItem](self, "navigationItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v5;
  if (v4)
    objc_msgSend(v5, "leftBarButtonItem");
  else
    objc_msgSend(v5, "rightBarButtonItem");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setEnabled:", 1);

}

- (void)calendarEditItemWillChangeSharees:(id)a3
{
  void *v4;
  NSSet *v5;
  NSSet *shareesBeforeSave;
  id v7;

  -[EKAbstractCalendarEditor calendar](self, "calendar", a3);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "sharees");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (NSSet *)objc_msgSend(v4, "copy");
  shareesBeforeSave = self->_shareesBeforeSave;
  self->_shareesBeforeSave = v5;

}

- (void)calendarEditItem:(id)a3 shareesChanged:(id)a4 changesSaved:(BOOL)a5
{
  _BOOL4 v5;
  NSSet *shareesBeforeSave;
  _QWORD v8[5];

  v5 = a5;
  -[EKAbstractCalendarEditor reconfigureAndReloadEditItems](self, "reconfigureAndReloadEditItems", a3, a4);
  if (v5)
  {
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __65__EKCalendarEditor_calendarEditItem_shareesChanged_changesSaved___block_invoke;
    v8[3] = &unk_1E6019D80;
    v8[4] = self;
    objc_msgSend(MEMORY[0x1E0CAA090], "requestFamilyShareesWithCompletion:", v8);
  }
  else
  {
    shareesBeforeSave = self->_shareesBeforeSave;
    self->_shareesBeforeSave = 0;

  }
}

void __65__EKCalendarEditor_calendarEditItem_shareesChanged_changesSaved___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  _QWORD *v4;
  uint64_t v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  __CFNotificationCenter *DarwinNotifyCenter;
  uint64_t v16;
  void *v17;
  int v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1E0CAA090];
  v4 = *(_QWORD **)(a1 + 32);
  v5 = v4[145];
  v6 = a2;
  objc_msgSend(v4, "calendar");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "source");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v3) = objc_msgSend(v3, "isFamilyCalendarGivenCalendarSharees:familySharees:isPrimaryAppleAccount:", v5, v6, objc_msgSend(v8, "isPrimaryAppleAccount"));

  v9 = (void *)MEMORY[0x1E0CAA090];
  objc_msgSend(*(id *)(a1 + 32), "calendar");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v9) = objc_msgSend(v9, "isFamilyCalendar:givenFamilySharees:", v10, v6);

  if ((_DWORD)v3 != (_DWORD)v9)
  {
    v11 = (void *)kEKUILogHandle;
    if (os_log_type_enabled((os_log_t)kEKUILogHandle, OS_LOG_TYPE_DEFAULT))
    {
      v12 = *(void **)(a1 + 32);
      v13 = v11;
      objc_msgSend(v12, "calendar");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = 138412290;
      v19 = v14;
      _os_log_impl(&dword_1AF84D000, v13, OS_LOG_TYPE_DEFAULT, "Sending out family calendar changed darwin notification. %@", (uint8_t *)&v18, 0xCu);

    }
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterPostNotification(DarwinNotifyCenter, (CFNotificationName)*MEMORY[0x1E0CA9F98], 0, 0, 1u);
  }
  v16 = *(_QWORD *)(a1 + 32);
  v17 = *(void **)(v16 + 1160);
  *(_QWORD *)(v16 + 1160) = 0;

}

- (void)accountEditItem:(id)a3 selectedSourceChanged:(id)a4
{
  -[EKCalendarEditor selectedSourceChanged:](self, "selectedSourceChanged:", a4);
}

- (void)selectedSourceChanged:(id)a3
{
  void *v4;
  int v5;
  void *v6;
  id v7;

  v7 = a3;
  -[EKAbstractCalendarEditor calendar](self, "calendar");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isNew");

  if (v5)
  {
    -[EKAbstractCalendarEditor calendar](self, "calendar");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setSharees:", 0);

  }
  -[EKCalendarEditor updateShouldSuggestFamilyShareesWithSource:](self, "updateShouldSuggestFamilyShareesWithSource:", v7);
  -[EKAbstractCalendarEditor reconfigureAndReloadEditItems](self, "reconfigureAndReloadEditItems");

}

- (void)viewWillLayoutSubviews
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
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
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  -[EKAbstractCalendarEditor editItems](self, "editItems", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v11;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v11 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v10 + 1) + 8 * v7);
        -[EKCalendarEditor view](self, "view");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "frame");
        objc_msgSend(v8, "layoutForWidth:", CGRectGetWidth(v16));

        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v5);
  }

}

- (BOOL)isNewFamilyCalendar
{
  return self->_isNewFamilyCalendar;
}

- (void)setIsNewFamilyCalendar:(BOOL)a3
{
  self->_isNewFamilyCalendar = a3;
}

- (NSString)prefillCalendarTitle
{
  return self->_prefillCalendarTitle;
}

- (void)setPrefillCalendarTitle:(id)a3
{
  objc_storeStrong((id *)&self->_prefillCalendarTitle, a3);
}

- (EKSharee)meSharee
{
  return self->_meSharee;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_meSharee, 0);
  objc_storeStrong((id *)&self->_prefillCalendarTitle, 0);
  objc_storeStrong((id *)&self->_shareesBeforeSave, 0);
  objc_storeStrong((id *)&self->_limitedToSource, 0);
  objc_storeStrong((id *)&self->_deleteItem, 0);
  objc_storeStrong((id *)&self->_publishItem, 0);
  objc_storeStrong((id *)&self->_affectsAvailabilityItem, 0);
  objc_storeStrong((id *)&self->_ignoreAlertsItem, 0);
  objc_storeStrong((id *)&self->_colorEditItem, 0);
  objc_storeStrong((id *)&self->_ignoreSharedResourceChangeNotificationsItem, 0);
  objc_storeStrong((id *)&self->_shareesEditItem, 0);
  objc_storeStrong((id *)&self->_accountItem, 0);
  objc_storeStrong((id *)&self->_titleItem, 0);
}

@end
