@implementation EKEventEditViewControllerDefaultImpl

+ (void)setDefaultDatesForEvent:(id)a3
{
  id v3;
  void *v4;
  id v5;
  id v6;

  v3 = a3;
  CUIKNowDate();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  CUIKGetDefaultStartAndEndTimeForDate();
  v5 = 0;
  v6 = 0;

  objc_msgSend(v3, "setStartDate:", v5);
  objc_msgSend(v3, "setEndDateUnadjustedForLegacyClients:", v6);

}

- (EKEventEditViewControllerDefaultImpl)initWithNibName:(id)a3 bundle:(id)a4
{
  EKEventEditViewControllerDefaultImpl *v4;
  EKEventEditor *v5;
  EKEventEditor *editor;
  void *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)EKEventEditViewControllerDefaultImpl;
  v4 = -[EKEventEditViewControllerDefaultImpl initWithNibName:bundle:](&v9, sel_initWithNibName_bundle_, a3, a4);
  if (v4)
  {
    EKUILogInitIfNeeded();
    v5 = objc_alloc_init(EKEventEditor);
    editor = v4->_editor;
    v4->_editor = v5;

    -[EKCalendarItemEditor setEditorDelegate:](v4->_editor, "setEditorDelegate:", v4);
    -[EKEventEditViewControllerDefaultImpl addChildViewController:](v4, "addChildViewController:", v4->_editor);
    -[EKEventEditor didMoveToParentViewController:](v4->_editor, "didMoveToParentViewController:", v4);
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addObserver:selector:name:object:", v4, sel__storeChanged_, *MEMORY[0x1E0CA9F88], v4->_store);

  }
  return v4;
}

- (void)loadView
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
  objc_super v28;
  _QWORD v29[6];

  v29[4] = *MEMORY[0x1E0C80C00];
  v28.receiver = self;
  v28.super_class = (Class)EKEventEditViewControllerDefaultImpl;
  -[EKEventEditViewControllerDefaultImpl loadView](&v28, sel_loadView);
  -[EKEventEditViewControllerDefaultImpl view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKEventEditor view](self->_editor, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addSubview:", v4);

  -[EKEventEditor view](self->_editor, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  v18 = (void *)MEMORY[0x1E0CB3718];
  -[EKEventEditor view](self->_editor, "view");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "leadingAnchor");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKEventEditViewControllerDefaultImpl view](self, "view");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "leadingAnchor");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "constraintEqualToAnchor:", v24);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v29[0] = v23;
  -[EKEventEditor view](self->_editor, "view");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "trailingAnchor");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKEventEditViewControllerDefaultImpl view](self, "view");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "trailingAnchor");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "constraintEqualToAnchor:", v19);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v29[1] = v17;
  -[EKEventEditor view](self->_editor, "view");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "topAnchor");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKEventEditViewControllerDefaultImpl view](self, "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "topAnchor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "constraintEqualToAnchor:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v29[2] = v8;
  -[EKEventEditor view](self->_editor, "view");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "bottomAnchor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKEventEditViewControllerDefaultImpl view](self, "view");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "bottomAnchor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "constraintEqualToAnchor:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v29[3] = v13;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v29, 4);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "activateConstraints:", v14);

  -[EKEventEditViewControllerDefaultImpl _annotateEventEntityIfNeeded](self, "_annotateEventEntityIfNeeded");
}

- (void)preferredContentSizeDidChangeForChildContentContainer:(id)a3
{
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)EKEventEditViewControllerDefaultImpl;
  v4 = a3;
  -[EKEventEditViewControllerDefaultImpl preferredContentSizeDidChangeForChildContentContainer:](&v9, sel_preferredContentSizeDidChangeForChildContentContainer_, v4);
  objc_msgSend(v4, "preferredContentSize", v9.receiver, v9.super_class);
  v6 = v5;
  v8 = v7;

  -[EKEventEditViewControllerDefaultImpl setPreferredContentSize:](self, "setPreferredContentSize:", v6, v8);
}

- (void)viewDidAppear:(BOOL)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)EKEventEditViewControllerDefaultImpl;
  -[EKEventEditViewControllerDefaultImpl viewDidAppear:](&v3, sel_viewDidAppear_, a3);
  if (objc_msgSend((id)*MEMORY[0x1E0DC4730], "isRunningTest"))
    dispatch_async(MEMORY[0x1E0C80D38], &__block_literal_global);
}

void __54__EKEventEditViewControllerDefaultImpl_viewDidAppear___block_invoke()
{
  id v0;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v0 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "postNotificationName:object:", CFSTR("EKEventEditViewControllerDidAppear"), 0);

}

- (void)viewDidDisappear:(BOOL)a3
{
  void *v4;
  int v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)EKEventEditViewControllerDefaultImpl;
  -[EKEventEditViewControllerDefaultImpl viewDidDisappear:](&v6, sel_viewDidDisappear_, a3);
  if (!self->_completedWithAction)
  {
    -[EKEventEditViewControllerDefaultImpl parentViewController](self, "parentViewController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "isBeingDismissed");

    if (v5)
      -[EKEventEditViewControllerDefaultImpl editor:didCompleteWithAction:](self, "editor:didCompleteWithAction:", self->_editor, 0);
  }
}

- (BOOL)isModalInPresentation
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)EKEventEditViewControllerDefaultImpl;
  if (-[EKEventEditViewControllerDefaultImpl isModalInPresentation](&v4, sel_isModalInPresentation)
    || -[EKEventEditViewControllerDefaultImpl hasUnsavedChanges](self, "hasUnsavedChanges"))
  {
    return 1;
  }
  if ((-[EKEventEditViewControllerDefaultImpl _isInPopoverPresentation](self, "_isInPopoverPresentation") & 1) != 0)
    return 0;
  return !-[EKEventEditViewControllerDefaultImpl displayingRootView](self, "displayingRootView");
}

- (void)setEventStore:(id)a3
{
  EKEventStore **p_store;
  id v6;

  p_store = &self->_store;
  objc_storeStrong((id *)&self->_store, a3);
  v6 = a3;
  -[EKCalendarItemEditor setStore:](self->_editor, "setStore:", *p_store);

}

- (EKEventStore)eventStore
{
  return self->_store;
}

- (void)setEvent:(id)a3
{
  EKEvent **p_event;
  id v6;
  void *v7;
  NSString *v8;
  NSString *eventId;

  p_event = &self->_event;
  objc_storeStrong((id *)&self->_event, a3);
  v6 = a3;
  -[EKEvent eventIdentifier](*p_event, "eventIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (NSString *)objc_msgSend(v7, "copy");
  eventId = self->_eventId;
  self->_eventId = v8;

  -[EKEventEditor setEvent:](self->_editor, "setEvent:", *p_event);
  -[EKEventEditViewControllerDefaultImpl _annotateEventEntityIfNeeded](self, "_annotateEventEntityIfNeeded");
}

- (void)_annotateEventEntityIfNeeded
{
  -[UIViewController EKUI_annotateIfNeededWithAppEntityForEvent:isEditing:](self, "EKUI_annotateIfNeededWithAppEntityForEvent:isEditing:", self->_event, 1);
}

- (EKEvent)event
{
  return self->_event;
}

- (void)setShouldOverrideAuthorizationStatus:(BOOL)a3 withRemoteUIStatus:(int64_t)a4
{
  -[EKCalendarItemEditor setShouldOverrideAuthorizationStatus:withRemoteUIStatus:](self->_editor, "setShouldOverrideAuthorizationStatus:withRemoteUIStatus:", a3, a4);
}

- (void)setDefaultCalendar:(id)a3
{
  -[EKEventEditor setDefaultCalendar:](self->_editor, "setDefaultCalendar:", a3);
}

- (BOOL)shouldRecordPrecommitEvent
{
  return -[EKEventEditor shouldRecordPrecommitEvent](self->_editor, "shouldRecordPrecommitEvent");
}

- (void)setShouldRecordPrecommitEvent:(BOOL)a3
{
  -[EKEventEditor setShouldRecordPrecommitEvent:](self->_editor, "setShouldRecordPrecommitEvent:", a3);
}

- (id)precommitSerializedEvent
{
  return -[EKEventEditor precommitSerializedEvent](self->_editor, "precommitSerializedEvent");
}

- (void)setEventCreationMethod:(unint64_t)a3
{
  -[EKCalendarItemEditor setCalendarItemCreationMethod:](self->_editor, "setCalendarItemCreationMethod:", a3);
}

- (unint64_t)eventCreationMethod
{
  return -[EKCalendarItemEditor calendarItemCreationMethod](self->_editor, "calendarItemCreationMethod");
}

- (void)setSuggestionKey:(id)a3
{
  id v5;

  objc_storeStrong((id *)&self->_suggestionKey, a3);
  v5 = a3;
  -[EKEventEditor setSuggestionKey:](self->_editor, "setSuggestionKey:", v5);

}

- (void)refreshStartAndEndDates
{
  -[EKEventEditor refreshStartAndEndDates](self->_editor, "refreshStartAndEndDates");
}

- (void)refreshUIForUpdatedEvent
{
  id v3;

  -[EKEventEditor refreshTitle](self->_editor, "refreshTitle");
  -[EKEventEditor refreshURLAndNotes](self->_editor, "refreshURLAndNotes");
  -[EKEventEditor refreshStartAndEndDates](self->_editor, "refreshStartAndEndDates");
  -[EKEventEditor refreshRecurrence](self->_editor, "refreshRecurrence");
  -[EKEventEditor tableView](self->_editor, "tableView");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "reloadData");

}

- (void)cancelEditing
{
  -[EKEventEditViewControllerDefaultImpl cancelEditingWithDelegateNotification:forceCancel:](self, "cancelEditingWithDelegateNotification:forceCancel:", 0, 0);
}

- (void)cancelEditingWithDelegateNotification:(BOOL)a3 forceCancel:(BOOL)a4
{
  -[EKCalendarItemEditor cancelEditingWithDelegateNotification:forceCancel:](self->_editor, "cancelEditingWithDelegateNotification:forceCancel:", a3, a4);
}

- (BOOL)editor:(id)a3 shouldCompleteWithAction:(int64_t)a4
{
  id v6;
  BOOL v7;

  v6 = a3;
  if (a4 == 1)
  {
    if (-[EKEventEditViewControllerDefaultImpl isModalInPresentation](self, "isModalInPresentation")
      && objc_msgSend(v6, "pendingVideoConference"))
    {
      -[EKEventEditViewControllerDefaultImpl presentationControllerDidAttemptToDismissWithPendingConference](self, "presentationControllerDidAttemptToDismissWithPendingConference");
      goto LABEL_9;
    }
LABEL_10:
    v7 = 1;
    goto LABEL_11;
  }
  if (a4
    || !-[EKEventEditViewControllerDefaultImpl isModalInPresentation](self, "isModalInPresentation")
    || -[EKEventEditViewControllerDefaultImpl ignoreUnsavedChanges](self, "ignoreUnsavedChanges"))
  {
    goto LABEL_10;
  }
  -[EKEventEditViewControllerDefaultImpl presentationControllerDidAttemptToDismiss](self, "presentationControllerDidAttemptToDismiss");
LABEL_9:
  v7 = 0;
LABEL_11:

  return v7;
}

- (void)editor:(id)a3 didCompleteWithAction:(int64_t)a4
{
  EKEventEditViewControllerDefaultImpl **p_strongSelf;
  id WeakRetained;
  void *v8;
  id v9;
  char v10;
  id v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  int v22;
  void *v23;
  void *v24;
  EKEventEditViewControllerDefaultImpl *v25;

  p_strongSelf = &self->_strongSelf;
  objc_storeStrong((id *)&self->_strongSelf, self);
  WeakRetained = objc_loadWeakRetained((id *)&self->_editViewDelegate);
  if (WeakRetained)
  {
    v8 = WeakRetained;
    v9 = objc_loadWeakRetained((id *)&self->_editViewDelegate);
    v10 = objc_opt_respondsToSelector();

    if ((v10 & 1) != 0)
    {
      v11 = objc_loadWeakRetained((id *)&self->_editViewDelegate);
      -[EKEventEditViewControllerDefaultImpl _ekEventEditViewControllerForDelegate](self, "_ekEventEditViewControllerForDelegate");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "eventEditViewController:didCompleteWithAction:", v12, a4);

    }
  }
  if (a4)
  {
    if (a4 == 1
      && ((-[EKEvent isNew](self->_event, "isNew") & 1) != 0
       || -[EKEvent _hasChangesForKey:](self->_event, "_hasChangesForKey:", CFSTR("location"))))
    {
      -[EKEvent preferredLocation](self->_event, "preferredLocation");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v13, "isPrediction");

      if (v14)
      {
        v15 = (void *)MEMORY[0x1E0CAA160];
        -[EKEvent preferredLocation](self->_event, "preferredLocation");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "predictedLOI");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = v15;
        v19 = v17;
        v20 = 5;
LABEL_14:
        objc_msgSend(v18, "userInteractionWithPredictedLocationOfInterest:interaction:", v19, v20);

      }
    }
  }
  else if ((-[EKEvent isNew](self->_event, "isNew") & 1) != 0
         || -[EKEvent _hasChangesForKey:](self->_event, "_hasChangesForKey:", CFSTR("location")))
  {
    -[EKEvent preferredLocation](self->_event, "preferredLocation");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v21, "isPrediction");

    if (v22)
    {
      v23 = (void *)MEMORY[0x1E0CAA160];
      -[EKEvent preferredLocation](self->_event, "preferredLocation");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "predictedLOI");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = v23;
      v19 = v17;
      v20 = 6;
      goto LABEL_14;
    }
  }
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "removeObserver:name:object:", self, *MEMORY[0x1E0CA9F88], self->_store);

  v25 = *p_strongSelf;
  *p_strongSelf = 0;

  self->_completedWithAction = 1;
}

- (void)editor:(id)a3 prepareCalendarItemForEdit:(id)a4
{
  void *v5;
  id WeakRetained;
  void *v7;
  id v8;
  char v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  v14 = a4;
  objc_msgSend(v14, "calendar");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_editViewDelegate);
    if (!WeakRetained)
      goto LABEL_5;
    v7 = WeakRetained;
    v8 = objc_loadWeakRetained((id *)&self->_editViewDelegate);
    v9 = objc_opt_respondsToSelector();

    if ((v9 & 1) == 0
      || (v10 = objc_loadWeakRetained((id *)&self->_editViewDelegate),
          -[EKEventEditViewControllerDefaultImpl _ekEventEditViewControllerForDelegate](self, "_ekEventEditViewControllerForDelegate"), v11 = (void *)objc_claimAutoreleasedReturnValue(), objc_msgSend(v10, "eventEditViewControllerDefaultCalendarForNewEvents:", v11), v12 = (void *)objc_claimAutoreleasedReturnValue(), v11, v10, !v12))
    {
LABEL_5:
      -[EKEventStore defaultCalendarForNewEvents](self->_store, "defaultCalendarForNewEvents");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v14, "setCalendar:", v12);

  }
  objc_msgSend(v14, "startDate");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v13)
    objc_msgSend((id)objc_opt_class(), "setDefaultDatesForEvent:", v14);

}

- (id)pasteboardManagerForCalendarItemEditor:(id)a3
{
  void *v4;
  char v5;
  void *v6;
  void *v7;
  void *v8;

  -[EKEventEditViewControllerDefaultImpl editViewDelegate](self, "editViewDelegate", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    -[EKEventEditViewControllerDefaultImpl editViewDelegate](self, "editViewDelegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKEventEditViewControllerDefaultImpl _ekEventEditViewControllerForDelegate](self, "_ekEventEditViewControllerForDelegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "pasteboardManagerForEventEditViewController:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8 = 0;
  }
  return v8;
}

- (void)attemptDisplayReviewPrompt
{
  EKEventEditViewControllerDefaultImpl *v3;
  EKEventEditViewControllerDefaultImpl *v4;
  char v5;
  EKEventEditViewControllerDefaultImpl *v6;

  -[EKEventEditViewControllerDefaultImpl editViewDelegate](self, "editViewDelegate");
  v3 = (EKEventEditViewControllerDefaultImpl *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3 != self)
  {
    v6 = v3;
    v5 = objc_opt_respondsToSelector();
    v4 = v6;
    if ((v5 & 1) != 0)
    {
      -[EKEventEditViewControllerDefaultImpl attemptDisplayReviewPrompt](v6, "attemptDisplayReviewPrompt");
      v4 = v6;
    }
  }

}

- (void)_storeChanged:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  if (self->_eventId)
  {
    v6 = v4;
    -[EKEvent eventStore](self->_event, "eventStore");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    v4 = v6;
    if (!v5)
    {
      -[EKCalendarItemEditor completeWithAction:animated:](self->_editor, "completeWithAction:animated:", 2, 0);
      v4 = v6;
    }
  }

}

- (unint64_t)supportedInterfaceOrientations
{
  void *v3;
  _BOOL4 IsRegularInViewHierarchy;

  if (self->_editor)
    return -[EKEventEditor supportedInterfaceOrientations](self->_editor, "supportedInterfaceOrientations");
  -[EKEventEditViewControllerDefaultImpl view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  IsRegularInViewHierarchy = EKUICurrentWidthSizeClassIsRegularInViewHierarchy(v3);

  if (IsRegularInViewHierarchy)
    return 30;
  else
    return 26;
}

- (CGSize)preferredContentSize
{
  double v2;
  double v3;
  CGSize result;

  -[EKEventEditor preferredContentSize](self->_editor, "preferredContentSize");
  result.height = v3;
  result.width = v2;
  return result;
}

- (void)completeAndSave
{
  -[EKCalendarItemEditor completeAndSave](self->_editor, "completeAndSave");
}

- (void)completeAndSaveWithContinueBlock:(id)a3
{
  -[EKCalendarItemEditor completeAndSaveWithContinueBlock:](self->_editor, "completeAndSaveWithContinueBlock:", a3);
}

- (BOOL)willPresentDialogOnSave
{
  return -[EKCalendarItemEditor willPresentDialogOnSave](self->_editor, "willPresentDialogOnSave");
}

- (BOOL)hasUnsavedChanges
{
  return -[EKEventEditor hasUnsavedChanges](self->_editor, "hasUnsavedChanges")
      || -[EKCalendarItemEditor isTextEditing](self->_editor, "isTextEditing");
}

- (void)focusAndSelectTitle
{
  -[EKEventEditor focus:select:](self->_editor, "focus:select:", 1, 1);
}

- (void)focusAndSelectStartDate
{
  -[EKEventEditor focus:select:](self->_editor, "focus:select:", 2, 1);
}

- (void)focusTitle
{
  -[EKEventEditor focus:select:](self->_editor, "focus:select:", 1, 0);
}

- (void)setEditorBackgroundColor:(id)a3
{
  -[EKEventEditor setBackgroundColor:](self->_editor, "setBackgroundColor:", a3);
}

- (UIColor)editorBackgroundColor
{
  return -[EKEventEditor backgroundColor](self->_editor, "backgroundColor");
}

- (BOOL)timeImplicitlySet
{
  return -[EKCalendarItemEditor timeImplicitlySet](self->_editor, "timeImplicitlySet");
}

- (void)setTimeImplicitlySet:(BOOL)a3
{
  -[EKCalendarItemEditor setTimeImplicitlySet:](self->_editor, "setTimeImplicitlySet:", a3);
}

- (id)_leftBarButtonItem
{
  void *v2;
  void *v3;
  id v4;
  uint64_t v5;
  void *i;
  void *v7;
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
  -[EKCalendarItemEditor navigationItem](self->_editor, "navigationItem", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "leftBarButtonItems");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = (id)objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v4)
  {
    v5 = *(_QWORD *)v10;
    while (2)
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(_QWORD *)v10 != v5)
          objc_enumerationMutation(v3);
        v7 = *(void **)(*((_QWORD *)&v9 + 1) + 8 * (_QWORD)i);
        if (objc_msgSend(v7, "systemItem") != 5 && objc_msgSend(v7, "systemItem") != 6)
        {
          v4 = v7;
          goto LABEL_12;
        }
      }
      v4 = (id)objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
      if (v4)
        continue;
      break;
    }
  }
LABEL_12:

  return v4;
}

- (id)_rightBarButtonItem
{
  void *v2;
  void *v3;
  id v4;
  uint64_t v5;
  void *i;
  void *v7;
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
  -[EKCalendarItemEditor navigationItem](self->_editor, "navigationItem", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "rightBarButtonItems");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = (id)objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v4)
  {
    v5 = *(_QWORD *)v10;
    while (2)
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(_QWORD *)v10 != v5)
          objc_enumerationMutation(v3);
        v7 = *(void **)(*((_QWORD *)&v9 + 1) + 8 * (_QWORD)i);
        if (objc_msgSend(v7, "systemItem") != 5 && objc_msgSend(v7, "systemItem") != 6)
        {
          v4 = v7;
          goto LABEL_12;
        }
      }
      v4 = (id)objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
      if (v4)
        continue;
      break;
    }
  }
LABEL_12:

  return v4;
}

- (id)_confirmDismissAlertExplanationText
{
  int v2;
  void *v3;
  void *v4;
  const __CFString *v5;
  void *v6;

  v2 = -[EKEvent isNew](self->_event, "isNew");
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v2)
    v5 = CFSTR("Are you sure you want to discard this new event?");
  else
    v5 = CFSTR("Are you sure you want to discard your changes?");
  objc_msgSend(v3, "localizedStringForKey:value:table:", v5, &stru_1E601DFA8, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)alertIconImage
{
  id v2;
  void *v3;
  void *v4;
  double v5;
  double v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;

  v2 = objc_alloc(MEMORY[0x1E0D3A820]);
  v3 = (void *)objc_msgSend(v2, "initWithBundleIdentifier:", *MEMORY[0x1E0D0C468]);
  objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "scale");
  v6 = v5;

  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D3A830]), "initWithSize:scale:", 100.0, 100.0, v6);
  objc_msgSend(v3, "imageForDescriptor:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "placeholder"))
  {
    objc_msgSend(v3, "prepareImageForDescriptor:", v7);
    v9 = objc_claimAutoreleasedReturnValue();

    v8 = (void *)v9;
  }
  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3870]), "initWithCGImage:", objc_msgSend(v8, "CGImage"));

  return v10;
}

- (id)confirmDismissAlertController
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
  _QWORD v15[5];

  -[EKEventEditViewControllerDefaultImpl _confirmDismissAlertExplanationText](self, "_confirmDismissAlertExplanationText");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[EKUIAlertController alertControllerWithTitle:message:preferredStyle:](EKUIAlertController, "alertControllerWithTitle:message:preferredStyle:", 0, v3, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setProhibitsRotation:", 1);
  -[EKEventEditViewControllerDefaultImpl alertIconImage](self, "alertIconImage");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setImage:", v5);

  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("Discard Changes"), &stru_1E601DFA8, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __69__EKEventEditViewControllerDefaultImpl_confirmDismissAlertController__block_invoke;
  v15[3] = &unk_1E60185C0;
  v15[4] = self;
  objc_msgSend(MEMORY[0x1E0DC3448], "actionWithTitle:style:handler:", v7, 2, v15);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addAction:", v8);

  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "localizedStringForKey:value:table:", CFSTR("Keep Editing"), &stru_1E601DFA8, 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0DC3448], "actionWithTitle:style:handler:", v10, 1, 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addAction:", v11);

  -[EKEventEditViewControllerDefaultImpl _leftBarButtonItem](self, "_leftBarButtonItem");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "popoverPresentationController");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setBarButtonItem:", v12);

  return v4;
}

uint64_t __69__EKEventEditViewControllerDefaultImpl_confirmDismissAlertController__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "cancelEditingWithDelegateNotification:forceCancel:", 1, 1);
}

- (id)confirmPendingConferenceDismissAlertController
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
  void *v15;
  void *v16;
  _QWORD v18[5];

  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("Save without video call link?"), &stru_1E601DFA8, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("This will save the event before the video call link finishes loading."), &stru_1E601DFA8, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  +[EKUIAlertController alertControllerWithTitle:message:preferredStyle:](EKUIAlertController, "alertControllerWithTitle:message:preferredStyle:", v4, v6, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setProhibitsRotation:", 1);
  -[EKEventEditViewControllerDefaultImpl alertIconImage](self, "alertIconImage");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setImage:", v8);

  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "localizedStringForKey:value:table:", CFSTR("Save Event"), &stru_1E601DFA8, 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __86__EKEventEditViewControllerDefaultImpl_confirmPendingConferenceDismissAlertController__block_invoke;
  v18[3] = &unk_1E60185C0;
  v18[4] = self;
  objc_msgSend(MEMORY[0x1E0DC3448], "actionWithTitle:style:handler:", v10, 2, v18);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addAction:", v11);

  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "localizedStringForKey:value:table:", CFSTR("Keep Editing"), &stru_1E601DFA8, 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0DC3448], "actionWithTitle:style:handler:", v13, 1, 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addAction:", v14);

  -[EKEventEditViewControllerDefaultImpl _rightBarButtonItem](self, "_rightBarButtonItem");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "popoverPresentationController");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setBarButtonItem:", v15);

  return v7;
}

uint64_t __86__EKEventEditViewControllerDefaultImpl_confirmPendingConferenceDismissAlertController__block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1016), "setPendingVideoConference:", 0);
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1016), "completeAndSave");
}

- (void)presentationControllerDidAttemptToDismiss
{
  id v3;

  if ((-[EKEventEditViewControllerDefaultImpl _isInPopoverPresentation](self, "_isInPopoverPresentation") & 1) != 0
    || -[EKEventEditViewControllerDefaultImpl displayingRootView](self, "displayingRootView"))
  {
    -[EKCalendarItemEditor resignCurrentEditItemFirstResponder](self->_editor, "resignCurrentEditItemFirstResponder");
    if (-[EKEventEditor isShowingAccessDeniedView](self->_editor, "isShowingAccessDeniedView"))
    {
      -[EKEventEditViewControllerDefaultImpl cancelEditingWithDelegateNotification:forceCancel:](self, "cancelEditingWithDelegateNotification:forceCancel:", 1, 1);
    }
    else
    {
      -[EKEventEditViewControllerDefaultImpl confirmDismissAlertController](self, "confirmDismissAlertController");
      v3 = (id)objc_claimAutoreleasedReturnValue();
      -[EKEventEditViewControllerDefaultImpl presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v3, 1, 0);

    }
  }
}

- (void)presentationControllerDidAttemptToDismissWithPendingConference
{
  id v3;

  if ((-[EKEventEditViewControllerDefaultImpl _isInPopoverPresentation](self, "_isInPopoverPresentation") & 1) != 0
    || -[EKEventEditViewControllerDefaultImpl displayingRootView](self, "displayingRootView"))
  {
    -[EKCalendarItemEditor resignCurrentEditItemFirstResponder](self->_editor, "resignCurrentEditItemFirstResponder");
    -[EKEventEditViewControllerDefaultImpl confirmPendingConferenceDismissAlertController](self, "confirmPendingConferenceDismissAlertController");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    -[EKEventEditViewControllerDefaultImpl presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v3, 1, 0);

  }
}

- (BOOL)displayingRootView
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  BOOL v6;

  -[EKEventEditViewControllerDefaultImpl navigationController](self, "navigationController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "visibleViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "viewControllers");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "firstObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v3 == v5;

  return v6;
}

- (NSString)suggestionKey
{
  return self->_suggestionKey;
}

- (EKEventEditViewDelegate)editViewDelegate
{
  return (EKEventEditViewDelegate *)objc_loadWeakRetained((id *)&self->_editViewDelegate);
}

- (void)setEditViewDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_editViewDelegate, a3);
}

- (BOOL)ignoreUnsavedChanges
{
  return self->ignoreUnsavedChanges;
}

- (void)setIgnoreUnsavedChanges:(BOOL)a3
{
  self->ignoreUnsavedChanges = a3;
}

- (EKEventEditor)editor
{
  return self->_editor;
}

- (void)setEditor:(id)a3
{
  objc_storeStrong((id *)&self->_editor, a3);
}

- (EKEventEditViewControllerDefaultImpl)strongSelf
{
  return self->_strongSelf;
}

- (void)setStrongSelf:(id)a3
{
  objc_storeStrong((id *)&self->_strongSelf, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_strongSelf, 0);
  objc_storeStrong((id *)&self->_editor, 0);
  objc_destroyWeak((id *)&self->_editViewDelegate);
  objc_storeStrong((id *)&self->_suggestionKey, 0);
  objc_storeStrong((id *)&self->_eventId, 0);
  objc_storeStrong((id *)&self->_event, 0);
  objc_storeStrong((id *)&self->_store, 0);
}

@end
