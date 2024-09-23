@implementation EKEventEditor

+ (Class)_SGSuggestionsServiceClass
{
  return (Class)EKWeakLinkClass();
}

- (void)loadView
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)EKEventEditor;
  -[EKCalendarItemEditor loadView](&v6, sel_loadView);
  -[EKEventEditor backgroundColor](self, "backgroundColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[EKEventEditor backgroundColor](self, "backgroundColor");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKEventEditor view](self, "view");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setBackgroundColor:", v4);

  }
}

- (unint64_t)supportedInterfaceOrientations
{
  void *v2;
  void *v3;
  void *v4;
  char v5;
  objc_super v7;

  if (self->_isTransitioning)
  {
    -[EKEventEditor view](self, "view");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "window");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "windowScene");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "interfaceOrientation");

    return 1 << v5;
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)EKEventEditor;
    return -[EKCalendarItemEditor supportedInterfaceOrientations](&v7, sel_supportedInterfaceOrientations);
  }
}

- (void)viewWillAppear:(BOOL)a3
{
  objc_super v4;

  self->_isTransitioning = 1;
  v4.receiver = self;
  v4.super_class = (Class)EKEventEditor;
  -[EKCalendarItemEditor viewWillAppear:](&v4, sel_viewWillAppear_, a3);
  -[EKEventEditor setNeedsUpdateOfSupportedInterfaceOrientations](self, "setNeedsUpdateOfSupportedInterfaceOrientations");
}

- (void)viewDidAppear:(BOOL)a3
{
  void *v4;
  objc_class *v5;
  double v6;
  double v7;
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
  int v19;
  void *v20;
  void *v21;
  void *v22;
  NSObject *log;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  objc_super v30;
  uint8_t buf[4];
  void *v32;
  __int16 v33;
  void *v34;
  __int16 v35;
  double v36;
  __int16 v37;
  int v38;
  __int16 v39;
  void *v40;
  __int16 v41;
  void *v42;
  __int16 v43;
  void *v44;
  __int16 v45;
  void *v46;
  __int16 v47;
  void *v48;
  uint64_t v49;

  v49 = *MEMORY[0x1E0C80C00];
  v30.receiver = self;
  v30.super_class = (Class)EKEventEditor;
  -[EKCalendarItemEditor viewDidAppear:](&v30, sel_viewDidAppear_, a3);
  v4 = (void *)kEKUILogHandle;
  if (os_log_type_enabled((os_log_t)kEKUILogHandle, OS_LOG_TYPE_INFO))
  {
    log = v4;
    v5 = (objc_class *)objc_opt_class();
    NSStringFromClass(v5);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKEventEditor event](self, "event");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "startDate");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKEventEditor event](self, "event");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "duration");
    v7 = v6 / 60.0;
    -[EKEventEditor event](self, "event");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v25, "isNew");
    -[EKEventEditor event](self, "event");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "UUID");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKEventEditor event](self, "event");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "uniqueID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKEventEditor event](self, "event");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "externalURL");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKEventEditor event](self, "event");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "calendar");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "calendarIdentifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKEventEditor event](self, "event");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "calendar");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "source");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "sourceIdentifier");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138545410;
    v32 = v29;
    v33 = 2114;
    v34 = v28;
    v35 = 2048;
    v36 = v7;
    v37 = 1024;
    v38 = v19;
    v39 = 2114;
    v40 = v18;
    v41 = 2114;
    v42 = v8;
    v43 = 2114;
    v44 = v9;
    v45 = 2114;
    v46 = v11;
    v47 = 2114;
    v48 = v15;
    _os_log_impl(&dword_1AF84D000, log, OS_LOG_TYPE_INFO, "[UserStateLog] State -> %{public}@ viewDidAppear. startDate = %{public}@, duration = %.1f min, isNew = %d. UUID = %{public}@, uniqueID = %{public}@, externalURL = %{public}@, calendarIdentifier = %{public}@, sourceIdentifier = %{public}@", buf, 0x58u);

  }
  self->_isTransitioning = 0;
  -[EKEventEditor setNeedsUpdateOfSupportedInterfaceOrientations](self, "setNeedsUpdateOfSupportedInterfaceOrientations");
  -[EKEventEditor navigationController](self, "navigationController");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "presentationController");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "preferredContentSizeDidChangeForChildContentContainer:", self);

}

- (void)viewWillDisappear:(BOOL)a3
{
  objc_super v4;

  self->_isTransitioning = 1;
  v4.receiver = self;
  v4.super_class = (Class)EKEventEditor;
  -[EKCalendarItemEditor viewWillDisappear:](&v4, sel_viewWillDisappear_, a3);
  -[EKEventEditor setNeedsUpdateOfSupportedInterfaceOrientations](self, "setNeedsUpdateOfSupportedInterfaceOrientations");
}

- (void)viewDidDisappear:(BOOL)a3
{
  _BOOL8 v3;
  EKUIAutocompleteTracker *autocompleteTracker;
  void *v6;
  objc_super v7;

  v3 = a3;
  if (self->_shouldAutocomplete)
  {
    autocompleteTracker = self->_autocompleteTracker;
    -[EKEventEditor event](self, "event");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKUIAutocompleteTracker finalizeAutocompleteTrackingOnSave:withEvent:selectedResult:selectedIndex:isZKW:](autocompleteTracker, "finalizeAutocompleteTrackingOnSave:withEvent:selectedResult:selectedIndex:isZKW:", 0, v6, 0, 0, 0);

  }
  v7.receiver = self;
  v7.super_class = (Class)EKEventEditor;
  -[EKCalendarItemEditor viewDidDisappear:](&v7, sel_viewDidDisappear_, v3);
  self->_isTransitioning = 0;
  -[EKEventEditor setNeedsUpdateOfSupportedInterfaceOrientations](self, "setNeedsUpdateOfSupportedInterfaceOrientations");
}

- (void)setEvent:(id)a3
{
  id v4;
  void *v5;
  EKUIAutocompleteTracker *v6;
  EKUIAutocompleteTracker *autocompleteTracker;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  objc_super v13;

  v4 = a3;
  objc_msgSend(v4, "setPredictedLocationFrozen:", 1);
  v13.receiver = self;
  v13.super_class = (Class)EKEventEditor;
  -[EKCalendarItemEditor setCalendarItem:](&v13, sel_setCalendarItem_, v4);
  -[EKEventEditor preferredTitle](self, "preferredTitle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKCalendarItemEditor setTitle:](self, "setTitle:", v5);

  -[EKEventEditor _updateTitleEditItemSeparatorVisibility](self, "_updateTitleEditItemSeparatorVisibility");
  self->_shouldAutocomplete = objc_msgSend(v4, "isNew");
  v6 = objc_alloc_init(EKUIAutocompleteTracker);
  autocompleteTracker = self->_autocompleteTracker;
  self->_autocompleteTracker = v6;

  objc_msgSend(v4, "startDate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKUIAutocompleteTracker setInitialStartDate:](self->_autocompleteTracker, "setInitialStartDate:", v8);

  objc_msgSend(v4, "endDateUnadjustedForLegacyClients");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKUIAutocompleteTracker setInitialEndDate:](self->_autocompleteTracker, "setInitialEndDate:", v9);

  objc_msgSend(v4, "timeZone");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKUIAutocompleteTracker setInitialTimeZone:](self->_autocompleteTracker, "setInitialTimeZone:", v10);

  -[EKUIAutocompleteTracker setInitialIsAllDay:](self->_autocompleteTracker, "setInitialIsAllDay:", objc_msgSend(v4, "isAllDay"));
  objc_msgSend(v4, "calendar");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKUIAutocompleteTracker setInitialCalendar:](self->_autocompleteTracker, "setInitialCalendar:", v11);

  if ((objc_msgSend(v4, "isNew") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CAA068], "sharedInstance");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "prepareForEventUpdate:", v4);

  }
  -[UIResponder EKUI_setDataOwnersFromEvent:](self, "EKUI_setDataOwnersFromEvent:", v4);

}

- (void)setSuggestionKey:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  char v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  id v31;
  void *v32;
  void *v33;
  void *v34;
  id v35;
  void *v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  _BYTE v41[128];
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (v5)
  {
    objc_storeStrong((id *)&self->_suggestionKey, a3);
    -[EKEventEditor event](self, "event");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      -[EKCalendarItemEditor store](self, "store");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "predicateForNaturalLanguageSuggestedEventsWithSearchString:", 0);
      v8 = objc_claimAutoreleasedReturnValue();

      -[EKCalendarItemEditor store](self, "store");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v36 = (void *)v8;
      objc_msgSend(v9, "eventsMatchingPredicate:", v8);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      v39 = 0u;
      v40 = 0u;
      v37 = 0u;
      v38 = 0u;
      v11 = v10;
      v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v37, v41, 16);
      v13 = v11;
      if (v12)
      {
        v14 = v12;
        v35 = v5;
        v15 = *(_QWORD *)v38;
LABEL_5:
        v16 = 0;
        while (1)
        {
          if (*(_QWORD *)v38 != v15)
            objc_enumerationMutation(v11);
          v17 = *(void **)(*((_QWORD *)&v37 + 1) + 8 * v16);
          objc_msgSend(v17, "suggestionInfo");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "uniqueKey");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v20 = objc_msgSend(v19, "isEqualToString:", self->_suggestionKey);

          if ((v20 & 1) != 0)
            break;
          if (v14 == ++v16)
          {
            v14 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v37, v41, 16);
            if (v14)
              goto LABEL_5;
            v13 = v11;
            v5 = v35;
            goto LABEL_14;
          }
        }
        v13 = v17;

        v5 = v35;
        if (!v13)
          goto LABEL_15;
        EKWeakLinkStringConstant();
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "customObjectForKey:", v34);
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        -[EKEventEditor event](self, "event");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "setCustomObject:forKey:", v33, v34);

        v31 = objc_alloc(MEMORY[0x1E0CAA168]);
        objc_msgSend(v13, "suggestionInfo");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "opaqueKey");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "suggestionInfo");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "uniqueKey");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "suggestionInfo");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "extractionGroupIdentifier");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v32 = (void *)objc_msgSend(v31, "initWithOpaqueKey:uniqueKey:extractionGroupIdentifier:", v23, v25, v27);

        -[EKEventEditor event](self, "event");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "setSuggestionInfo:", v32);

        objc_msgSend(v13, "URL");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        -[EKEventEditor event](self, "event");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "setURL:", v29);

      }
LABEL_14:

LABEL_15:
    }
  }

}

- (void)_updateTitleEditItemSeparatorVisibility
{
  uint64_t v3;
  void *v4;
  void *v5;

  if (self->_autocompleteResultsVisible)
  {
    v3 = 1;
  }
  else
  {
    -[EKEventEditor event](self, "event");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "preferredLocation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = objc_msgSend(v5, "isPrediction");

  }
  -[EKCalendarItemTitleInlineEditItem setDrawsOwnRowSeparators:](self->_titleInlineEditItem, "setDrawsOwnRowSeparators:", v3);
}

- (void)setDefaultCalendar:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)EKEventEditor;
  -[EKCalendarItemEditor setDefaultCalendar:](&v4, sel_setDefaultCalendar_, a3);
  -[EKCalendarItemEditItem refreshFromCalendarItemAndStore](self->_calendarEditItem, "refreshFromCalendarItemAndStore");
}

- (void)refreshStartAndEndDates
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)EKEventEditor;
  -[EKCalendarItemEditor refreshStartAndEndDates](&v3, sel_refreshStartAndEndDates);
  -[EKEventDateEditItem refreshFromCalendarItemAndStore](self->_dateItem, "refreshFromCalendarItemAndStore");
  -[EKCalendarItemAlarmEditItem refreshFromCalendarItemAndStore](self->_alarmEditItem, "refreshFromCalendarItemAndStore");
}

- (void)refreshInvitees
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)EKEventEditor;
  -[EKCalendarItemEditor refreshInvitees](&v3, sel_refreshInvitees);
  -[EKEventAttendeesEditItem refreshFromCalendarItemAndStore](self->_attendeesEditItem, "refreshFromCalendarItemAndStore");
}

- (void)refreshLocation
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)EKEventEditor;
  -[EKCalendarItemEditor refreshLocation](&v3, sel_refreshLocation);
  -[EKCalendarItemLocationInlineEditItem refreshFromCalendarItemAndStore](self->_locationInlineEditItem, "refreshFromCalendarItemAndStore");
  -[EKEventEditor _updateTitleEditItemSeparatorVisibility](self, "_updateTitleEditItemSeparatorVisibility");
}

- (void)refreshURL
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)EKEventEditor;
  -[EKCalendarItemEditor refreshURL](&v3, sel_refreshURL);
  -[EKEventURLAndNotesInlineEditItem refreshFromCalendarItemAndStore](self->_notesEditItem, "refreshFromCalendarItemAndStore");
}

- (void)refreshRecurrence
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)EKEventEditor;
  -[EKCalendarItemEditor refreshRecurrence](&v3, sel_refreshRecurrence);
  -[EKCalendarItemRecurrenceEditItem refreshFromCalendarItemAndStore](self->_recurrenceEditItem, "refreshFromCalendarItemAndStore");
}

- (void)refreshAttachments
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)EKEventEditor;
  -[EKCalendarItemEditor refreshRecurrence](&v3, sel_refreshRecurrence);
  -[EKEventAttachmentsEditItem refreshFromCalendarItemAndStore](self->_attachmentsEditItem, "refreshFromCalendarItemAndStore");
}

- (void)refreshTitle
{
  -[EKCalendarItemTitleInlineEditItem refreshFromCalendarItemAndStore](self->_titleInlineEditItem, "refreshFromCalendarItemAndStore");
}

- (id)_calendarItemIndexSet
{
  unint64_t v2;

  v2 = -[EKCalendarItemEditor tableSectionForEditItem:](self, "tableSectionForEditItem:", self->_calendarEditItem);
  return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB36B8]), "initWithIndex:", v2);
}

- (id)_editItems
{
  NSArray *editItems;
  EKCalendarItemTitleInlineEditItem *v4;
  EKEventDateEditItem *v5;
  EKEventAttendeesEditItem *v6;
  EKEventAttachmentsEditItem *v7;
  EKEventURLAndNotesInlineEditItem *v8;
  void *v9;
  EKEventAttendeesEditItem *v10;
  EKEventAutocompleteResultsEditItem *v11;
  NSArray *v12;
  NSArray *v13;
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
  char v26;
  void *v27;
  NSArray *v28;
  NSArray *v29;
  NSArray *orderedEditItems;
  EKCalendarItemCalendarEditItem *v32;
  EKEventAutocompleteResultsEditItem *v33;
  EKEventDeleteButtonEditItem *v34;
  EKEventURLAndNotesInlineEditItem *v35;
  EKEventAttachmentsEditItem *v36;
  EKConferenceInformationInlineEditItem *v37;
  EKEventVisibilityEditItem *v38;
  EKCalendarItemAlarmEditItem *v39;
  EKEventRecurrenceEditItem *obj;
  EKEventTravelTimeEditItem *v41;
  EKCalendarItemLocationInlineEditItem *v42;
  EKEventDeleteButtonEditItem *v43;
  EKEventURLAndNotesInlineEditItem *v44;
  EKConferenceInformationInlineEditItem *v45;
  EKEventAttachmentsEditItem *v46;
  EKEventVisibilityEditItem *v47;
  EKCalendarItemAlarmEditItem *v48;
  _QWORD v49[2];
  EKEventRecurrenceEditItem *v50;
  _QWORD v51[2];
  _QWORD v52[5];

  v52[3] = *MEMORY[0x1E0C80C00];
  editItems = self->super._editItems;
  if (!editItems)
  {
    v4 = objc_alloc_init(EKCalendarItemTitleInlineEditItem);
    v42 = objc_alloc_init(EKCalendarItemLocationInlineEditItem);
    v5 = objc_alloc_init(EKEventDateEditItem);
    v41 = objc_alloc_init(EKEventTravelTimeEditItem);
    obj = objc_alloc_init(EKEventRecurrenceEditItem);
    v6 = objc_alloc_init(EKEventAttendeesEditItem);
    v39 = objc_alloc_init(EKCalendarItemAlarmEditItem);
    v32 = -[EKCalendarItemCalendarEditItem initWithEntityType:]([EKCalendarItemCalendarEditItem alloc], "initWithEntityType:", 0);
    v38 = objc_alloc_init(EKEventVisibilityEditItem);
    v7 = objc_alloc_init(EKEventAttachmentsEditItem);
    v37 = objc_alloc_init(EKConferenceInformationInlineEditItem);
    v8 = objc_alloc_init(EKEventURLAndNotesInlineEditItem);
    v34 = objc_alloc_init(EKEventDeleteButtonEditItem);
    -[EKEventDeleteButtonEditItem setDeleteButtonTarget:action:](v34, "setDeleteButtonTarget:action:", self, sel_deleteClicked_);
    -[EKEventEditor event](self, "event");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKEventDateEditItem setShowsAllDay:](v5, "setShowsAllDay:", objc_msgSend(v9, "changingAllDayPropertyIsAllowed"));

    objc_storeStrong((id *)&self->_dateItem, v5);
    objc_storeStrong((id *)&self->_titleInlineEditItem, v4);
    objc_storeStrong((id *)&self->_locationInlineEditItem, v42);
    objc_storeStrong((id *)&self->_alarmEditItem, v39);
    objc_storeStrong((id *)&self->_calendarEditItem, v32);
    v10 = v6;
    objc_storeStrong((id *)&self->_attendeesEditItem, v6);
    objc_storeStrong((id *)&self->_notesEditItem, v8);
    objc_storeStrong((id *)&self->_attachmentsEditItem, v7);
    objc_storeStrong((id *)&self->_recurrenceEditItem, obj);
    v11 = objc_alloc_init(EKEventAutocompleteResultsEditItem);
    -[EKCalendarItemEditItem setDelegate:](v11, "setDelegate:", self);
    objc_storeStrong((id *)&self->_autocompleteEditItem, v11);
    -[EKEventEditor _updateTitleEditItemSeparatorVisibility](self, "_updateTitleEditItemSeparatorVisibility");
    v12 = (NSArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v13 = (NSArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    -[NSArray addObject:](v12, "addObject:", v4);
    v33 = v11;
    -[NSArray addObject:](v12, "addObject:", v11);
    -[NSArray addObject:](v12, "addObject:", v42);
    v14 = v5;
    -[NSArray addObject:](v12, "addObject:", v5);
    -[NSArray addObject:](v12, "addObject:", v41);
    -[NSArray addObject:](v12, "addObject:", obj);
    -[NSArray addObject:](v12, "addObject:", v10);
    -[NSArray addObject:](v12, "addObject:", v39);
    -[NSArray addObject:](v12, "addObject:", v32);
    -[NSArray addObject:](v12, "addObject:", v38);
    v36 = v7;
    -[NSArray addObject:](v12, "addObject:", v7);
    -[NSArray addObject:](v12, "addObject:", v37);
    v35 = v8;
    -[NSArray addObject:](v12, "addObject:", v8);
    -[EKCalendarItemEditor calendarItem](self, "calendarItem");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v5) = objc_msgSend(v15, "isNew");

    if ((v5 & 1) == 0)
      -[NSArray addObject:](v12, "addObject:", v34);
    v52[0] = v4;
    v52[1] = v33;
    v52[2] = v42;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v52, 3);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSArray addObject:](v13, "addObject:", v16);

    v51[0] = v14;
    v51[1] = v41;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v51, 2);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSArray addObject:](v13, "addObject:", v17);

    v50 = obj;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v50, 1);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSArray addObject:](v13, "addObject:", v18);

    v49[0] = v32;
    v49[1] = v10;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v49, 2);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSArray addObject:](v13, "addObject:", v19);

    v48 = v39;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v48, 1);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSArray addObject:](v13, "addObject:", v20);

    v47 = v38;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v47, 1);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSArray addObject:](v13, "addObject:", v21);

    v46 = v7;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v46, 1);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSArray addObject:](v13, "addObject:", v22);

    v45 = v37;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v45, 1);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSArray addObject:](v13, "addObject:", v23);

    v44 = v35;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v44, 1);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSArray addObject:](v13, "addObject:", v24);

    -[EKCalendarItemEditor calendarItem](self, "calendarItem");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = objc_msgSend(v25, "isNew");

    if ((v26 & 1) == 0)
    {
      v43 = v34;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v43, 1);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSArray addObject:](v13, "addObject:", v27);

    }
    v28 = self->super._editItems;
    self->super._editItems = v12;
    v29 = v12;

    orderedEditItems = self->super._orderedEditItems;
    self->super._orderedEditItems = v13;

    editItems = self->super._editItems;
  }
  return editItems;
}

- (id)_orderedEditItems
{
  NSArray *orderedEditItems;
  id v4;

  orderedEditItems = self->super._orderedEditItems;
  if (!orderedEditItems)
  {
    v4 = -[EKEventEditor _editItems](self, "_editItems");
    orderedEditItems = self->super._orderedEditItems;
  }
  return orderedEditItems;
}

- (BOOL)hasAttachmentChanges
{
  return -[EKEventAttachmentsEditItem attachmentsModified](self->_attachmentsEditItem, "attachmentsModified");
}

- (BOOL)hasUnsavedChanges
{
  objc_super v4;

  if (-[EKEventAttachmentsEditItem attachmentsModified](self->_attachmentsEditItem, "attachmentsModified"))
    return 1;
  v4.receiver = self;
  v4.super_class = (Class)EKEventEditor;
  return -[EKCalendarItemEditor hasUnsavedChanges](&v4, sel_hasUnsavedChanges);
}

- (BOOL)attachmentsModifiedOnRecurrence
{
  _BOOL4 v3;
  void *v4;
  char v5;

  v3 = -[EKEventAttachmentsEditItem attachmentsModified](self->_attachmentsEditItem, "attachmentsModified");
  if (v3)
  {
    -[EKEventEditor event](self, "event");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "isOrWasPartOfRecurringSeries");

    LOBYTE(v3) = v5;
  }
  return v3;
}

- (id)attachmentsModifiedEvent
{
  return -[EKEventAttachmentsEditItem attachmentEvent](self->_attachmentsEditItem, "attachmentEvent");
}

- (EKRemoteUISerializedObject)precommitSerializedEvent
{
  return self->_precommitSerializedEvent;
}

- (BOOL)saveCalendarItemWithSpan:(int64_t)a3 error:(id *)a4
{
  NSObject *v7;
  void *v8;
  uint64_t v9;
  EKUIAutocompleteTracker *autocompleteTracker;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  int v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  id *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  char v37;
  void *v38;
  void *v39;
  int v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  int v45;
  _TtC10EventKitUI33EKRemoteUIObjectSerializerWrapper *v46;
  EKRemoteUISerializedObject *v47;
  EKRemoteUISerializedObject *precommitSerializedEvent;
  char v49;
  BOOL v50;
  void *v51;
  NSObject *v52;
  int64_t v54;
  uint8_t buf[16];

  EKUILogSignpostHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v7))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1AF84D000, v7, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "SaveEvent", " enableTelemetry=YES ", buf, 2u);
  }

  -[EKEventEditor event](self, "event");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_shouldAutocomplete)
  {
    if (self->_zeroKeywordResult)
      v9 = -[EKAutocompleteSearchResult isEqual:](self->_selectedAutocompleteResult, "isEqual:");
    else
      v9 = 0;
    autocompleteTracker = self->_autocompleteTracker;
    -[EKEventEditor event](self, "event");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKUIAutocompleteTracker finalizeAutocompleteTrackingOnSave:withEvent:selectedResult:selectedIndex:isZKW:](autocompleteTracker, "finalizeAutocompleteTrackingOnSave:withEvent:selectedResult:selectedIndex:isZKW:", 1, v11, self->_selectedAutocompleteResult, self->_selectedAutocompleteResultIndex, v9);

    if ((_DWORD)v9)
    {
      objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "_SGSuggestionsServiceClass"), "serviceForEvents");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[EKAutocompleteSearchResult suggestionInfo](self->_zeroKeywordResult, "suggestionInfo");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "uniqueKey");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = v12;
      v16 = v14;
      v17 = 14;
LABEL_12:
      objc_msgSend(v15, "logEventInteractionForEventWithUniqueKey:interface:actionType:", v16, v17, 6);

      goto LABEL_13;
    }
    if (self->_naturalLanguageResult
      && -[EKAutocompleteSearchResult isEqual:](self->_selectedAutocompleteResult, "isEqual:"))
    {
      objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "_SGSuggestionsServiceClass"), "serviceForEvents");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[EKAutocompleteSearchResult suggestionInfo](self->_naturalLanguageResult, "suggestionInfo");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "uniqueKey");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = v12;
      v16 = v14;
      v17 = 15;
      goto LABEL_12;
    }
  }
LABEL_13:
  -[EKEventEditor suggestionKey](self, "suggestionKey");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (v18)
  {
    objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "_SGSuggestionsServiceClass"), "serviceForEvents");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKEventEditor suggestionKey](self, "suggestionKey");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "logEventInteractionForEventWithUniqueKey:interface:actionType:", v20, 20, 6);

  }
  v21 = objc_msgSend(v8, "isNew");
  if (a3 || v21)
  {
    objc_msgSend(v8, "recurrenceRules");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "firstObject");
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v23, "recurrenceEnd");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "endDate");
    v25 = (void *)objc_claimAutoreleasedReturnValue();

    if (v25)
    {
      CUIKCalendar();
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "components:fromDate:", 30, v25);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "startDate");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "components:fromDate:", 224, v28);
      v54 = a3;
      v29 = a4;
      v30 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v27, "setHour:", objc_msgSend(v30, "hour"));
      objc_msgSend(v27, "setMinute:", objc_msgSend(v30, "minute"));
      objc_msgSend(v27, "setSecond:", objc_msgSend(v30, "second"));
      objc_msgSend(v26, "dateFromComponents:", v27);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CAA108], "recurrenceEndWithEndDate:", v31);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "setRecurrenceEnd:", v32);

      a4 = v29;
      a3 = v54;

    }
  }
  if (objc_msgSend(v8, "hasAttendees", v54)
    && (objc_msgSend(v8, "allowsAttendeesModifications") & 1) == 0)
  {
    objc_msgSend(v8, "setAttendees:", 0);
  }
  objc_msgSend(v8, "structuredLocation");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v33, "isStructured"))
  {
    objc_msgSend(v8, "calendar");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "source");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "constraints");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = objc_msgSend(v36, "supportsStructuredLocations");

    if ((v37 & 1) != 0)
      goto LABEL_27;
    v38 = (void *)MEMORY[0x1E0CAA158];
    objc_msgSend(v8, "location");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "locationWithTitle:", v33);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setStructuredLocation:", v39);

  }
LABEL_27:
  v40 = objc_msgSend(v8, "isNew");
  objc_msgSend(MEMORY[0x1E0CAA068], "sharedInstance");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  v42 = v41;
  if (v40)
  {
    objc_msgSend(v41, "handleEventCreation:", v8);

    CalAnalyticsSendEventLazy();
  }
  else
  {
    objc_msgSend(v41, "handleEventUpdate:", v8);

  }
  -[EKCalendarItemEditor editorDelegate](self, "editorDelegate");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "editorForCalendarItemEditor:", self);
  v44 = (void *)objc_claimAutoreleasedReturnValue();

  if (self->_shouldRecordPrecommitEvent)
  {
    v45 = objc_msgSend(v44, "saveEventForOOPModificationRecording:span:error:", v8, a3, a4);
    v46 = objc_alloc_init(_TtC10EventKitUI33EKRemoteUIObjectSerializerWrapper);
    -[EKRemoteUIObjectSerializerWrapper serializedRepresentationWithEkObject:](v46, "serializedRepresentationWithEkObject:", v8);
    v47 = (EKRemoteUISerializedObject *)objc_claimAutoreleasedReturnValue();
    precommitSerializedEvent = self->_precommitSerializedEvent;
    self->_precommitSerializedEvent = v47;

    if (!v45)
    {
      v50 = 0;
      goto LABEL_38;
    }
    v49 = objc_msgSend(v44, "commitEventForOOPModificationRecording:error:", v8, a4);

    if ((v49 & 1) == 0)
    {
LABEL_33:
      v50 = 0;
      goto LABEL_39;
    }
  }
  else if (!objc_msgSend(v44, "saveEvent:span:error:", v8, a3, a4))
  {
    goto LABEL_33;
  }
  objc_msgSend(v8, "suggestionInfo");
  v51 = (void *)objc_claimAutoreleasedReturnValue();

  if (v51)
  {
    -[EKCalendarItemEditor store](self, "store");
    v46 = (_TtC10EventKitUI33EKRemoteUIObjectSerializerWrapper *)objc_claimAutoreleasedReturnValue();
    -[EKRemoteUIObjectSerializerWrapper confirmSuggestedEvent:](v46, "confirmSuggestedEvent:", v8);
    v50 = 1;
LABEL_38:

    goto LABEL_39;
  }
  v50 = 1;
LABEL_39:
  EKUILogSignpostHandle();
  v52 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v52))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1AF84D000, v52, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "SaveEvent", " enableTelemetry=YES ", buf, 2u);
  }

  return v50;
}

void __48__EKEventEditor_saveCalendarItemWithSpan_error___block_invoke(uint64_t a1, void *a2)
{
  unint64_t v3;
  id v4;

  v4 = a2;
  v3 = objc_msgSend(*(id *)(a1 + 32), "calendarItemCreationMethod") - 1;
  if (v3 <= 3)
    objc_msgSend(v4, "setObject:forKeyedSubscript:", off_1E601C0F8[v3], CFSTR("method"));

}

- (id)preferredTitle
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  const __CFString *v6;
  void *v7;

  -[EKEventEditor event](self, "event");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2 && (objc_msgSend(v2, "isNew") & 1) == 0)
  {
    EventKitUIBundle();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v4;
    v6 = CFSTR("Edit Event");
  }
  else
  {
    EventKitUIBundle();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v4;
    v6 = CFSTR("New Event");
  }
  objc_msgSend(v4, "localizedStringForKey:value:table:", v6, &stru_1E601DFA8, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)defaultTitleForCalendarItem
{
  void *v2;
  void *v3;

  EventKitUIBundle();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("Untitled event"), CFSTR("New Event"), 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)_nameForDeleteButton
{
  void *v2;
  void *v3;

  EventKitUIBundle();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("Delete Event"), &stru_1E601DFA8, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)defaultAlertTitle
{
  void *v2;
  void *v3;

  EventKitUIBundle();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("Cannot Save Event"), &stru_1E601DFA8, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)notificationNamesForLocaleChange
{
  return (id)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObject:", *MEMORY[0x1E0D0CA70]);
}

- (unint64_t)entityType
{
  return 0;
}

- (void)setBackgroundColor:(id)a3
{
  UIColor *v5;
  int v6;
  void *v7;
  UIColor *v8;

  v5 = (UIColor *)a3;
  if (self->_backgroundColor != v5)
  {
    v8 = v5;
    objc_storeStrong((id *)&self->_backgroundColor, a3);
    v6 = -[EKEventEditor isViewLoaded](self, "isViewLoaded");
    v5 = v8;
    if (v6)
    {
      -[EKEventEditor view](self, "view", v8);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setBackgroundColor:", v8);

      v5 = v8;
    }
  }

}

- (CGSize)preferredContentSize
{
  double v3;
  double v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  CGSize result;

  v3 = EKUIContainedControllerIdealWidth();
  v4 = EKUIContainedControllerIdealHeight();
  -[EKEventEditor view](self, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "sizeThatFits:", v3, v4);
  v7 = v6;

  v8 = v3;
  v9 = v7;
  result.height = v9;
  result.width = v8;
  return result;
}

- (void)prepareEditItems
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)EKEventEditor;
  -[EKCalendarItemEditor prepareEditItems](&v3, sel_prepareEditItems);
  -[EKEventEditor _updateTitleEditItemSeparatorVisibility](self, "_updateTitleEditItemSeparatorVisibility");
}

- (void)_focusAppearanceTarget
{
  unint64_t focusOnAppearanceTarget;
  EKEventDateEditItem *dateItem;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  focusOnAppearanceTarget = self->_focusOnAppearanceTarget;
  if (focusOnAppearanceTarget == 2)
  {
    dateItem = self->_dateItem;
    if (dateItem)
    {
      -[EKEventDateEditItem cellForSubitemAtIndex:](dateItem, "cellForSubitemAtIndex:", 1);
      v9 = (id)objc_claimAutoreleasedReturnValue();
      -[EKEventEditor tableView](self, "tableView");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "indexPathForCell:", v9);
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      -[EKEventEditor tableView](self, "tableView");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "selectRowAtIndexPath:animated:scrollPosition:", v6, 1, 0);

      -[EKEventEditor tableView](self, "tableView");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[EKCalendarItemEditor tableView:didSelectRowAtIndexPath:](self, "tableView:didSelectRowAtIndexPath:", v8, v6);

      self->_focusOnAppearanceTarget = 0;
    }
  }
  else if (focusOnAppearanceTarget == 1)
  {
    if (-[EKCalendarItemTitleInlineEditItem focusTitleAndSelectTitle:](self->_titleInlineEditItem, "focusTitleAndSelectTitle:", self->_selectOnFocus))
    {
      self->_focusOnAppearanceTarget = 0;
    }
  }
}

- (void)focus:(unint64_t)a3 select:(BOOL)a4
{
  self->_focusOnAppearanceTarget = a3;
  self->_selectOnFocus = a4;
  -[EKEventEditor _focusAppearanceTarget](self, "_focusAppearanceTarget");
}

- (BOOL)isShowingAccessDeniedView
{
  return (unint64_t)(self->super._lastAuthorizationStatus - 5) < 0xFFFFFFFFFFFFFFFELL;
}

- (void)_revertEvent
{
  void *v3;
  id v4;

  -[EKEventEditor event](self, "event");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "rollback");

  -[EKEventEditor event](self, "event");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "forceLocationPredictionUpdate");

}

- (id)_viewForSheet
{
  void *v3;
  void *v4;
  void *v5;

  -[EKCalendarItemEditor currentEditItem](self, "currentEditItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3
    || (-[EKCalendarItemEditor currentEditItem](self, "currentEditItem"),
        v4 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v4, "viewForActionSheet"),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        v4,
        !v5))
  {
    -[EKEventEditor view](self, "view");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v5;
}

- (void)_setEventTitleForTestingAutocomplete:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[EKEventEditor event](self, "event");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setTitle:", v5);

  -[EKCalendarItemTitleInlineEditItem setTitle:](self->_titleInlineEditItem, "setTitle:", v5);
  -[EKEventEditor _scheduleAutocompleteSearchWithString:](self, "_scheduleAutocompleteSearchWithString:", v5);

}

- (void)editItemTextChanged:(id)a3
{
  EKCalendarItemTitleInlineEditItem *v4;
  objc_super v5;

  v4 = (EKCalendarItemTitleInlineEditItem *)a3;
  if (self->_titleInlineEditItem == v4)
    -[EKEventEditor _showAutocompleteResults](self, "_showAutocompleteResults");
  v5.receiver = self;
  v5.super_class = (Class)EKEventEditor;
  -[EKCalendarItemEditor editItemTextChanged:](&v5, sel_editItemTextChanged_, v4);

}

- (void)editItemDidStartEditing:(id)a3
{
  EKCalendarItemTitleInlineEditItem *titleInlineEditItem;
  id v6;
  objc_super v7;

  titleInlineEditItem = self->_titleInlineEditItem;
  v6 = a3;
  if (titleInlineEditItem == a3)
    -[EKEventEditor _showAutocompleteResults](self, "_showAutocompleteResults");
  else
    -[EKEventEditor _hideAndCancelAutocompleteResults](self, "_hideAndCancelAutocompleteResults");
  v7.receiver = self;
  v7.super_class = (Class)EKEventEditor;
  -[EKCalendarItemEditor editItemDidStartEditing:](&v7, sel_editItemDidStartEditing_, v6);

}

- (void)editItem:(id)a3 didSaveFromDetailViewController:(BOOL)a4
{
  _BOOL8 v4;
  EKCalendarItemCalendarEditItem *v6;
  void *v7;
  objc_super v8;

  v4 = a4;
  v6 = (EKCalendarItemCalendarEditItem *)a3;
  if (self->_calendarEditItem == v6)
  {
    -[EKEventEditor event](self, "event");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIResponder EKUI_setDataOwnersFromEvent:](self, "EKUI_setDataOwnersFromEvent:", v7);

  }
  if (objc_msgSend((id)-[EKEventEditor superclass](self, "superclass"), "instancesRespondToSelector:", sel_editItem_didSaveFromDetailViewController_))
  {
    v8.receiver = self;
    v8.super_class = (Class)EKEventEditor;
    -[EKCalendarItemEditor editItem:didSaveFromDetailViewController:](&v8, sel_editItem_didSaveFromDetailViewController_, v6, v4);
  }

}

- (void)_showAutocompleteResults
{
  id v3;

  if (self->_shouldAutocomplete && !self->_selectedAutocompleteResult)
  {
    -[EKCalendarItemTitleInlineEditItem searchStringForEventAutocomplete](self->_titleInlineEditItem, "searchStringForEventAutocomplete");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    -[EKEventEditor _scheduleAutocompleteSearchWithString:](self, "_scheduleAutocompleteSearchWithString:", v3);

  }
}

- (void)_hideAndCancelAutocompleteResults
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __50__EKEventEditor__hideAndCancelAutocompleteResults__block_invoke;
  block[3] = &unk_1E6018688;
  block[4] = self;
  dispatch_async(MEMORY[0x1E0C80D38], block);
}

uint64_t __50__EKEventEditor__hideAndCancelAutocompleteResults__block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1208), "setResults:", MEMORY[0x1E0C9AA60]);
  return objc_msgSend(*(id *)(a1 + 32), "_cancelPendingAutocompleteAndCleanup");
}

- (void)_scheduleAutocompleteSearchWithString:(id)a3
{
  void *v5;
  int v6;
  id v7;

  v7 = a3;
  objc_msgSend(MEMORY[0x1E0D0CDE0], "sharedPreferences");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "eventAutocompleteEnabled");

  if (v6)
  {
    objc_storeStrong((id *)&self->_autocompleteSearchString, a3);
    -[EKEventEditor _scheduleAutocompleteTimerIfNeeded](self, "_scheduleAutocompleteTimerIfNeeded");
  }

}

- (void)_scheduleAutocompleteTimerIfNeeded
{
  NSTimer *v3;
  NSTimer *autocompleteTimer;

  if (!self->_autocompleteTimer)
  {
    objc_msgSend(MEMORY[0x1E0C99E88], "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:", self, sel__beginAutocompleteSearch_, 0, 0, 0.35);
    v3 = (NSTimer *)objc_claimAutoreleasedReturnValue();
    autocompleteTimer = self->_autocompleteTimer;
    self->_autocompleteTimer = v3;

  }
}

- (void)_cancelPendingAutocompleteAndCleanup
{
  NSTimer *autocompleteTimer;
  NSTimer *v4;

  autocompleteTimer = self->_autocompleteTimer;
  if (autocompleteTimer)
  {
    -[NSTimer invalidate](autocompleteTimer, "invalidate");
    v4 = self->_autocompleteTimer;
    self->_autocompleteTimer = 0;

  }
}

- (void)_beginAutocompleteSearch:(id)a3
{
  NSString *v4;
  NSString *v5;
  uint64_t v6;
  void *v7;
  EKEventSuggestionGenerator *v8;
  EKEventSuggestionGenerator *suggestionGenerator;
  uint64_t v10;
  EKEventSuggestionGenerator *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  NSString *v18;
  char v19;
  id v20;
  _QWORD v21[4];
  NSString *v22;
  EKEventEditor *v23;
  char v24;

  v20 = a3;
  v4 = self->_autocompleteSearchString;
  v5 = v4;
  if (v4)
  {
    v6 = -[NSString length](v4, "length");
    -[EKEventEditor _cancelPendingAutocompleteAndCleanup](self, "_cancelPendingAutocompleteAndCleanup");
    if (v6)
    {
      -[EKUIAutocompleteTracker trackAutocompleteQuery](self->_autocompleteTracker, "trackAutocompleteQuery");
      v19 = 0;
      goto LABEL_6;
    }
  }
  else
  {
    -[EKEventEditor _cancelPendingAutocompleteAndCleanup](self, "_cancelPendingAutocompleteAndCleanup");
  }
  -[EKUIAutocompleteTracker trackZKWQuery](self->_autocompleteTracker, "trackZKWQuery");
  v19 = 1;
LABEL_6:
  if (objc_msgSend((id)*MEMORY[0x1E0DC4730], "isRunningTest"))
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "postNotificationName:object:", _EventKitUI_EventEditorDidBeginAutocompleteSearchNotification, self);

  }
  if (!self->_suggestionGenerator)
  {
    v8 = (EKEventSuggestionGenerator *)objc_alloc_init(MEMORY[0x1E0CAA080]);
    suggestionGenerator = self->_suggestionGenerator;
    self->_suggestionGenerator = v8;

  }
  if (-[EKCalendarItemEditor timeImplicitlySet](self, "timeImplicitlySet"))
    v10 = 20;
  else
    v10 = 52;
  v11 = self->_suggestionGenerator;
  -[EKEventEditor event](self, "event");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "calendar");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKEventEditor event](self, "event");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "startDate");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKCalendarItemEditor editorDelegate](self, "editorDelegate");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "pasteboardManagerForCalendarItemEditor:", self);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __42__EKEventEditor__beginAutocompleteSearch___block_invoke;
  v21[3] = &unk_1E601C0D8;
  v22 = v5;
  v23 = self;
  v24 = v19;
  v18 = v5;
  -[EKEventSuggestionGenerator eventSuggestionsFromString:defaultCalendar:referenceDate:pasteboardItemProvider:defaultSuggestionVisibility:options:handler:](v11, "eventSuggestionsFromString:defaultCalendar:referenceDate:pasteboardItemProvider:defaultSuggestionVisibility:options:handler:", v18, v13, v15, v17, 1, v10, v21);

}

void __42__EKEventEditor__beginAutocompleteSearch___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  uint64_t v5;
  id v6;
  _QWORD v7[4];
  id v8;
  uint64_t v9;
  id v10;
  char v11;

  v3 = a2;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __42__EKEventEditor__beginAutocompleteSearch___block_invoke_2;
  v7[3] = &unk_1E601C0B0;
  v4 = *(id *)(a1 + 32);
  v5 = *(_QWORD *)(a1 + 40);
  v8 = v4;
  v9 = v5;
  v10 = v3;
  v11 = *(_BYTE *)(a1 + 48);
  v6 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], v7);

}

void __42__EKEventEditor__beginAutocompleteSearch___block_invoke_2(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  id obj;

  if (CalEqualStrings())
  {
    v2 = (void *)MEMORY[0x1E0CAA080];
    v3 = *(_QWORD *)(a1 + 48);
    objc_msgSend(*(id *)(a1 + 40), "event");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "startDate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "event");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "endDateUnadjustedForLegacyClients");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(*(id *)(a1 + 40), "timeImplicitlySet");
    CUIKCalendar();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "adjustTimeForUIAndApplyToAutocompleteResults:usingCurrentStartDate:currentEndDate:timeImplicitlySet:calendar:", v3, v5, v7, v8, v9);

    objc_msgSend(*(id *)(a1 + 48), "firstObject");
    obj = (id)objc_claimAutoreleasedReturnValue();
    if (*(_BYTE *)(a1 + 56))
    {
      if (objc_msgSend(obj, "source") == 2)
        objc_storeStrong((id *)(*(_QWORD *)(a1 + 40) + 1328), obj);
    }
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 1208), "setResults:", *(_QWORD *)(a1 + 48));
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 1352), "setFinalNumberOfAutocompleteResults:", objc_msgSend(*(id *)(a1 + 48), "count"));

  }
}

- (void)autocompleteResultsEditItem:(id)a3 resultSelected:(id)a4
{
  id v6;
  EKAutocompleteSearchResult **p_selectedAutocompleteResult;
  void *v8;
  void *v9;
  unint64_t v10;
  EKUIConfirmMultiPasteViewController *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  EKUIConfirmMultiPasteViewController *v18;
  void *v19;
  void *v20;
  void *v21;
  int v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  void *v33;
  void *v34;
  id v35;

  v35 = a3;
  v6 = a4;
  -[EKEventEditor _cancelPendingAutocompleteAndCleanup](self, "_cancelPendingAutocompleteAndCleanup");
  p_selectedAutocompleteResult = &self->_selectedAutocompleteResult;
  objc_storeStrong((id *)&self->_selectedAutocompleteResult, a4);
  -[EKEventAutocompleteResultsEditItem results](self->_autocompleteEditItem, "results");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  self->_selectedAutocompleteResultIndex = objc_msgSend(v8, "indexOfObject:", v6);

  objc_msgSend(v6, "pasteboardResults");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "count");

  if (v10 >= 2)
  {
    v11 = [EKUIConfirmMultiPasteViewController alloc];
    -[EKCalendarItemEditor editorDelegate](self, "editorDelegate");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "pasteboardManagerForCalendarItemEditor:", self);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKEventEditor event](self, "event");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "eventStore");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKEventEditor event](self, "event");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "startDate");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = -[EKUIConfirmMultiPasteViewController initWithSearchResult:pasteboardManager:eventStore:dateForPaste:](v11, "initWithSearchResult:pasteboardManager:eventStore:dateForPaste:", v6, v13, v15, v17);

    -[EKUIConfirmMultiPasteViewController setDelegate:](v18, "setDelegate:", self);
    v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3A40]), "initWithRootViewController:", v18);
    objc_msgSend(v19, "setModalPresentationStyle:", 16);
    -[EKCalendarItemEditor editItem:wantsViewControllerPresented:](self, "editItem:wantsViewControllerPresented:", v35, v19);

    goto LABEL_19;
  }
  -[EKEventEditor event](self, "event");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKEventEditor _modifyCurrentEvent:withAutocompleteResult:](self, "_modifyCurrentEvent:withAutocompleteResult:", v20, v6);

  objc_msgSend(v6, "preferredLocation");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_msgSend(v21, "isPrediction");

  v23 = (void *)MEMORY[0x1E0CAA160];
  if (v22)
  {
    objc_msgSend(v6, "preferredLocation");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "predictedLOI");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "userInteractionWithPredictedLocationOfInterest:interaction:", v25, 0);

  }
  else
  {
    if (objc_msgSend(v35, "hasSuggestedLocationResult"))
      v26 = 1;
    else
      v26 = 2;
    objc_msgSend(v23, "userInteractionWithPredictedLocationOfInterest:interaction:", 0, v26);
  }
  if (self->_zeroKeywordResult
    && -[EKAutocompleteSearchResult isEqual:](*p_selectedAutocompleteResult, "isEqual:"))
  {
    objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "_SGSuggestionsServiceClass"), "serviceForEvents");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKAutocompleteSearchResult suggestionInfo](*p_selectedAutocompleteResult, "suggestionInfo");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "uniqueKey");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = v27;
    v31 = v29;
    v32 = 14;
  }
  else
  {
    if (!self->_naturalLanguageResult
      || !-[EKAutocompleteSearchResult isEqual:](*p_selectedAutocompleteResult, "isEqual:"))
    {
      goto LABEL_16;
    }
    objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "_SGSuggestionsServiceClass"), "serviceForEvents");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKAutocompleteSearchResult suggestionInfo](*p_selectedAutocompleteResult, "suggestionInfo");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "uniqueKey");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = v27;
    v31 = v29;
    v32 = 15;
  }
  objc_msgSend(v30, "logEventInteractionForEventWithUniqueKey:interface:actionType:", v31, v32, 5);

LABEL_16:
  -[EKEventEditor editItemTextChanged:](self, "editItemTextChanged:", self->_titleInlineEditItem);
  -[EKEventEditor event](self, "event");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "notes");
  v34 = (void *)objc_claimAutoreleasedReturnValue();

  if (v34)
    -[EKEventURLAndNotesInlineEditItem reset](self->_notesEditItem, "reset");
  -[EKEventEditor prepareEditItems](self, "prepareEditItems");
  -[EKEventEditor _setAutocompleteResultsVisible:](self, "_setAutocompleteResultsVisible:", 0);
LABEL_19:

}

- (void)_modifyCurrentEvent:(id)a3 withAutocompleteResult:(id)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  id v16;

  v16 = a3;
  v6 = a4;
  if (objc_msgSend(v6, "source") == 4
    && (objc_msgSend(v6, "pasteboardResults"),
        v7 = (void *)objc_claimAutoreleasedReturnValue(),
        v8 = objc_msgSend(v7, "count"),
        v7,
        v8 == 1))
  {
    objc_msgSend(v6, "pasteboardResults");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "firstObject");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    -[EKCalendarItemEditor editorDelegate](self, "editorDelegate");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "pasteboardManagerForCalendarItemEditor:", self);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "calendarToPasteTo");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    v14 = 1;
  }
  else
  {
    v14 = 0;
    v13 = 0;
    v10 = v6;
  }
  objc_msgSend(v10, "updateEventFromSelf:updateTimeProperties:updateTravelTimeProperties:updateMode:overrideCalendar:", v16, 1, v14, 0, v13);
  objc_msgSend(v10, "attendees");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKCalendarItemEditor setHasModifiedAttendeesFromSuggestion:](self, "setHasModifiedAttendeesFromSuggestion:", objc_msgSend(v15, "count") != 0);

}

- (void)autocompleteResultsEditItemDidShowResults:(id)a3
{
  id v4;

  -[EKEventEditor _setAutocompleteResultsVisible:](self, "_setAutocompleteResultsVisible:", 1);
  if (objc_msgSend((id)*MEMORY[0x1E0DC4730], "isRunningTest"))
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "postNotificationName:object:", _EventKitUI_EventEditorDidShowAutocompleteResultsNotification, self);

  }
}

- (void)autocompleteResultsEditItemDidHideResults:(id)a3
{
  -[EKEventEditor _setAutocompleteResultsVisible:](self, "_setAutocompleteResultsVisible:", 0);
}

- (void)_setAutocompleteResultsVisible:(BOOL)a3
{
  EKAutocompleteSearchResult *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  char v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  if (self->_autocompleteResultsVisible != a3)
  {
    self->_autocompleteResultsVisible = a3;
    -[EKEventEditor _updateTitleEditItemSeparatorVisibility](self, "_updateTitleEditItemSeparatorVisibility");
    if (self->_autocompleteResultsVisible)
    {
      v4 = self->_zeroKeywordResult;
      v18 = 0u;
      v19 = 0u;
      v20 = 0u;
      v21 = 0u;
      -[EKEventAutocompleteResultsEditItem results](self->_autocompleteEditItem, "results", 0);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      if (v6)
      {
        v7 = v6;
        v8 = 0;
        v9 = *(_QWORD *)v19;
        do
        {
          for (i = 0; i != v7; ++i)
          {
            if (*(_QWORD *)v19 != v9)
              objc_enumerationMutation(v5);
            v11 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
            if (v4 && (objc_msgSend(*(id *)(*((_QWORD *)&v18 + 1) + 8 * i), "isEqual:", v4) & 1) != 0)
            {
              v8 = 1;
            }
            else if (objc_msgSend(v11, "source") == 2)
            {
              objc_storeStrong((id *)&self->_naturalLanguageResult, v11);
            }
          }
          v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
        }
        while (v7);

        if ((v8 & 1) != 0)
        {
          if (!self->_hasShownZeroKeywordResult)
          {
            self->_hasShownZeroKeywordResult = 1;
            -[EKUIAutocompleteTracker trackZKWResultShown](self->_autocompleteTracker, "trackZKWResultShown");
            objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "_SGSuggestionsServiceClass"), "serviceForEvents");
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            -[EKAutocompleteSearchResult suggestionInfo](v4, "suggestionInfo");
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v13, "uniqueKey");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v12, "logEventInteractionForEventWithUniqueKey:interface:actionType:", v14, 14, 4);

          }
LABEL_23:

          return;
        }
      }
      else
      {

      }
      -[EKUIAutocompleteTracker trackAutocompleteResultsShown](self->_autocompleteTracker, "trackAutocompleteResultsShown");
      if (self->_naturalLanguageResult)
      {
        if (!self->_hasShownNaturalLanguageResult)
        {
          self->_hasShownNaturalLanguageResult = 1;
          objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "_SGSuggestionsServiceClass"), "serviceForEvents");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          -[EKAutocompleteSearchResult suggestionInfo](self->_naturalLanguageResult, "suggestionInfo");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "uniqueKey");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "logEventInteractionForEventWithUniqueKey:interface:actionType:", v17, 15, 4);

        }
        -[EKUIAutocompleteTracker trackNLResultShown](self->_autocompleteTracker, "trackNLResultShown");
      }
      goto LABEL_23;
    }
  }
}

- (void)confirmMultiPasteViewController:(id)a3 finishedWithCancel:(BOOL)a4
{
  if (a4)
    -[EKEventEditor focus:select:](self, "focus:select:", 1, 0);
  else
    -[EKCalendarItemEditor cancelEditingWithDelegateNotification:forceCancel:](self, "cancelEditingWithDelegateNotification:forceCancel:", 1, 1);
}

- (UIColor)backgroundColor
{
  return self->_backgroundColor;
}

- (NSString)suggestionKey
{
  return self->_suggestionKey;
}

- (BOOL)shouldRecordPrecommitEvent
{
  return self->_shouldRecordPrecommitEvent;
}

- (void)setShouldRecordPrecommitEvent:(BOOL)a3
{
  self->_shouldRecordPrecommitEvent = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_suggestionKey, 0);
  objc_storeStrong((id *)&self->_backgroundColor, 0);
  objc_storeStrong((id *)&self->_precommitSerializedEvent, 0);
  objc_storeStrong((id *)&self->_suggestionGenerator, 0);
  objc_storeStrong((id *)&self->_autocompleteTracker, 0);
  objc_storeStrong((id *)&self->_naturalLanguageResult, 0);
  objc_storeStrong((id *)&self->_zeroKeywordResult, 0);
  objc_storeStrong((id *)&self->_selectedAutocompleteResult, 0);
  objc_storeStrong((id *)&self->_autocompleteSearchString, 0);
  objc_storeStrong((id *)&self->_autocompleteTimer, 0);
  objc_storeStrong((id *)&self->_recurrenceEditItem, 0);
  objc_storeStrong((id *)&self->_attendeesEditItem, 0);
  objc_storeStrong((id *)&self->_attachmentsEditItem, 0);
  objc_storeStrong((id *)&self->_notesEditItem, 0);
  objc_storeStrong((id *)&self->_alarmEditItem, 0);
  objc_storeStrong((id *)&self->_calendarEditItem, 0);
  objc_storeStrong((id *)&self->_locationInlineEditItem, 0);
  objc_storeStrong((id *)&self->_titleInlineEditItem, 0);
  objc_storeStrong((id *)&self->_autocompleteEditItem, 0);
  objc_storeStrong((id *)&self->_dateItem, 0);
}

@end
