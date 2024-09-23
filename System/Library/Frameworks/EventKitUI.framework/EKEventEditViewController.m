@implementation EKEventEditViewController

- (EKEventEditViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  EKEventEditViewController *v4;
  EKEventEditViewController *v5;
  uint64_t v6;
  EKEventEditViewControllerImpl *impl;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)EKEventEditViewController;
  v4 = -[EKEventEditViewController initWithNibName:bundle:](&v9, sel_initWithNibName_bundle_, a3, a4);
  v5 = v4;
  if (v4)
  {
    -[EKEventEditViewController commonInit](v4, "commonInit");
    +[SwappableViewControllerImplementationFactory eventEditViewControllerImpl](SwappableViewControllerImplementationFactory, "eventEditViewControllerImpl");
    v6 = objc_claimAutoreleasedReturnValue();
    impl = v5->_impl;
    v5->_impl = (EKEventEditViewControllerImpl *)v6;

    -[EKEventEditViewController pushViewController:animated:](v5, "pushViewController:animated:", v5->_impl, 0);
  }
  return v5;
}

- (EKEventEditViewController)initWithRemoteUI:(BOOL)a3
{
  _BOOL8 v3;
  EKEventEditViewController *v4;
  EKEventEditViewController *v5;
  uint64_t v6;
  EKEventEditViewControllerImpl *impl;
  objc_super v9;

  v3 = a3;
  v9.receiver = self;
  v9.super_class = (Class)EKEventEditViewController;
  v4 = -[EKEventEditViewController initWithNibName:bundle:](&v9, sel_initWithNibName_bundle_, 0, 0);
  v5 = v4;
  if (v4)
  {
    -[EKEventEditViewController commonInit](v4, "commonInit");
    +[SwappableViewControllerImplementationFactory eventEditViewControllerImplWithRemoteUI:](SwappableViewControllerImplementationFactory, "eventEditViewControllerImplWithRemoteUI:", v3);
    v6 = objc_claimAutoreleasedReturnValue();
    impl = v5->_impl;
    v5->_impl = (EKEventEditViewControllerImpl *)v6;

    -[EKEventEditViewController pushViewController:animated:](v5, "pushViewController:animated:", v5->_impl, 0);
  }
  return v5;
}

- (void)commonInit
{
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObserver:selector:name:object:", self, sel__contentSizeCategoryChanged_, *MEMORY[0x1E0DC48E8], 0);

  -[EKEventEditViewController _setClipUnderlapWhileTransitioning:](self, "_setClipUnderlapWhileTransitioning:", 1);
}

- (void)_contentSizeCategoryChanged:(id)a3
{
  +[EKUILargeTextUtilities clearCache](EKUILargeTextUtilities, "clearCache", a3);
}

- (CGSize)preferredContentSize
{
  double v2;
  double v3;
  CGSize result;

  -[EKEventEditViewControllerImpl preferredContentSize](self->_impl, "preferredContentSize");
  result.height = v3;
  result.width = v2;
  return result;
}

- (void)viewWillAppear:(BOOL)a3
{
  void *v4;
  void *v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)EKEventEditViewController;
  -[EKEventEditViewController viewWillAppear:](&v7, sel_viewWillAppear_, a3);
  -[EKEventEditViewController presentationController](self, "presentationController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    -[EKEventEditViewController presentationController](self, "presentationController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setDelegate:", self);

  }
}

- (void)viewIsAppearing:(BOOL)a3
{
  void *v4;
  int v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)EKEventEditViewController;
  -[EKEventEditViewController viewIsAppearing:](&v11, sel_viewIsAppearing_, a3);
  objc_msgSend(MEMORY[0x1E0D0CD78], "shared");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isCurrentProcessAnApplicationExtension");

  if (v5)
  {
    +[EKUIApplicationExtensionOverrides shared](EKUIApplicationExtensionOverrides, "shared");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "viewHierarchyOrOverride");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "ekui_tintColor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKEventEditViewController view](self, "view");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "window");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setTintColor:", v8);

  }
}

- (void)presentationControllerDidAttemptToDismiss:(id)a3
{
  -[EKEventEditViewControllerImpl presentationControllerDidAttemptToDismiss](self->_impl, "presentationControllerDidAttemptToDismiss", a3);
}

- (void)setEvent:(EKEvent *)event
{
  EKEvent *v4;
  EKEvent *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  EKEvent *v12;

  v12 = event;
  -[EKEventEditViewControllerImpl event](self->_impl, "event");
  v4 = (EKEvent *)objc_claimAutoreleasedReturnValue();

  v5 = v12;
  if (v4 != v12)
  {
    -[EKEventEditViewControllerImpl eventStore](self->_impl, "eventStore");
    v6 = objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      v7 = (void *)v6;
      -[EKEvent eventStore](v12, "eventStore");
      v8 = objc_claimAutoreleasedReturnValue();
      if (v8)
      {
        v9 = (void *)v8;
        -[EKEvent eventStore](v12, "eventStore");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        -[EKEventEditViewControllerImpl eventStore](self->_impl, "eventStore");
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        if (v10 != v11)
          objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("Event does not belong to eventStore"));
      }
      else
      {

      }
    }
    -[EKEventEditViewControllerImpl setEvent:](self->_impl, "setEvent:", v12);
    v5 = v12;
  }

}

- (EKEvent)event
{
  return (EKEvent *)-[EKEventEditViewControllerImpl event](self->_impl, "event");
}

- (void)setEventStore:(EKEventStore *)eventStore
{
  EKEventStore *v4;
  EKEventStore *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  EKEventStore *v12;
  void *v13;
  void *v14;
  EKEventStore *v15;

  v15 = eventStore;
  -[EKEventEditViewControllerImpl eventStore](self->_impl, "eventStore");
  v4 = (EKEventStore *)objc_claimAutoreleasedReturnValue();

  v5 = v15;
  if (v4 != v15)
  {
    -[EKEventEditViewControllerImpl event](self->_impl, "event");
    v6 = objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      v7 = (void *)v6;
      -[EKEventEditViewControllerImpl event](self->_impl, "event");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "eventStore");
      v9 = objc_claimAutoreleasedReturnValue();
      if (v9)
      {
        v10 = (void *)v9;
        -[EKEventEditViewControllerImpl event](self->_impl, "event");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "eventStore");
        v12 = (EKEventStore *)objc_claimAutoreleasedReturnValue();

        if (v12 != v15)
          objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("Event does not belong to eventStore"));
      }
      else
      {

      }
    }
    -[EKEventEditViewControllerImpl setEventStore:](self->_impl, "setEventStore:", v15);
    -[EKEventEditViewControllerImpl event](self->_impl, "event");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    v5 = v15;
    if (!v13)
    {
      objc_msgSend(MEMORY[0x1E0CAA060], "eventWithEventStore:", v15);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[EKEventEditViewControllerImpl setEvent:](self->_impl, "setEvent:", v14);

      v5 = v15;
    }
  }

}

- (EKEventStore)eventStore
{
  void *v3;
  NSObject *v4;
  uint8_t v6[16];

  -[EKEventEditViewControllerImpl eventStore](self->_impl, "eventStore");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    v4 = kEKUILogHandle;
    if (os_log_type_enabled((os_log_t)kEKUILogHandle, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v6 = 0;
      _os_log_impl(&dword_1AF84D000, v4, OS_LOG_TYPE_ERROR, "EKEventEditViewController: Getting eventStore before setting it", v6, 2u);
    }
  }
  -[EKEventEditViewControllerImpl eventStore](self->_impl, "eventStore");
  return (EKEventStore *)(id)objc_claimAutoreleasedReturnValue();
}

- (void)setShouldOverrideAuthorizationStatus:(BOOL)a3 withRemoteUIStatus:(int64_t)a4
{
  -[EKEventEditViewControllerImpl setShouldOverrideAuthorizationStatus:withRemoteUIStatus:](self->_impl, "setShouldOverrideAuthorizationStatus:withRemoteUIStatus:", a3, a4);
}

- (BOOL)shouldRecordPrecommitEvent
{
  return -[EKEventEditViewControllerImpl shouldRecordPrecommitEvent](self->_impl, "shouldRecordPrecommitEvent");
}

- (void)setShouldRecordPrecommitEvent:(BOOL)a3
{
  -[EKEventEditViewControllerImpl setShouldRecordPrecommitEvent:](self->_impl, "setShouldRecordPrecommitEvent:", a3);
}

- (id)precommitSerializedEvent
{
  return (id)-[EKEventEditViewControllerImpl precommitSerializedEvent](self->_impl, "precommitSerializedEvent");
}

- (void)setDefaultCalendar:(id)a3
{
  -[EKEventEditViewControllerImpl setDefaultCalendar:](self->_impl, "setDefaultCalendar:", a3);
}

- (void)setEditViewDelegate:(id)editViewDelegate
{
  -[EKEventEditViewControllerImpl setEditViewDelegate:](self->_impl, "setEditViewDelegate:", editViewDelegate);
}

- (id)editViewDelegate
{
  return (id)-[EKEventEditViewControllerImpl editViewDelegate](self->_impl, "editViewDelegate");
}

- (void)setInternalEditViewDelegate:(id)a3
{
  -[EKEventEditViewControllerImpl setEditViewDelegate:](self->_impl, "setEditViewDelegate:", a3);
}

- (EKEventOrIntegrationEditViewDelegate)internalEditViewDelegate
{
  void *v2;
  id v3;

  -[EKEventEditViewControllerImpl editViewDelegate](self->_impl, "editViewDelegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "conformsToProtocol:", &unk_1EEE94268))
    v3 = v2;
  else
    v3 = 0;

  return (EKEventOrIntegrationEditViewDelegate *)v3;
}

- (void)cancelEditing
{
  -[EKEventEditViewControllerImpl cancelEditing](self->_impl, "cancelEditing");
}

- (id)_eventEditorForTestingOnly
{
  return (id)-[EKEventEditViewControllerImpl _eventEditorForTestingOnly](self->_impl, "_eventEditorForTestingOnly");
}

- (void)setEventCreationMethod:(unint64_t)a3
{
  -[EKEventEditViewControllerImpl setEventCreationMethod:](self->_impl, "setEventCreationMethod:", a3);
}

- (unint64_t)eventCreationMethod
{
  return -[EKEventEditViewControllerImpl eventCreationMethod](self->_impl, "eventCreationMethod");
}

- (void)setIgnoreUnsavedChanges:(BOOL)a3
{
  -[EKEventEditViewControllerImpl setIgnoreUnsavedChanges:](self->_impl, "setIgnoreUnsavedChanges:", a3);
}

- (BOOL)ignoreUnsavedChanges
{
  return -[EKEventEditViewControllerImpl ignoreUnsavedChanges](self->_impl, "ignoreUnsavedChanges");
}

- (BOOL)displayingRootView
{
  void *v3;
  void *v4;
  void *v5;
  BOOL v6;

  -[EKEventEditViewController visibleViewController](self, "visibleViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKEventEditViewController viewControllers](self, "viewControllers");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "firstObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v3 == v5;

  return v6;
}

- (void)setSuggestionKey:(id)a3
{
  -[EKEventEditViewControllerImpl setSuggestionKey:](self->_impl, "setSuggestionKey:", a3);
}

- (NSString)suggestionKey
{
  return (NSString *)-[EKEventEditViewControllerImpl suggestionKey](self->_impl, "suggestionKey");
}

- (void)setTimeImplicitlySet:(BOOL)a3
{
  -[EKEventEditViewControllerImpl setTimeImplicitlySet:](self->_impl, "setTimeImplicitlySet:", a3);
}

- (BOOL)timeImplicitlySet
{
  return -[EKEventEditViewControllerImpl timeImplicitlySet](self->_impl, "timeImplicitlySet");
}

- (void)setEditorBackgroundColor:(id)a3
{
  -[EKEventEditViewControllerImpl setEditorBackgroundColor:](self->_impl, "setEditorBackgroundColor:", a3);
}

- (UIColor)editorBackgroundColor
{
  return (UIColor *)-[EKEventEditViewControllerImpl editorBackgroundColor](self->_impl, "editorBackgroundColor");
}

- (void)focusAndSelectTitle
{
  -[EKEventEditViewControllerImpl focusAndSelectTitle](self->_impl, "focusAndSelectTitle");
}

- (void)focusAndSelectStartDate
{
  -[EKEventEditViewControllerImpl focusAndSelectStartDate](self->_impl, "focusAndSelectStartDate");
}

- (void)focusTitle
{
  -[EKEventEditViewControllerImpl focusTitle](self->_impl, "focusTitle");
}

- (void)completeAndSave
{
  -[EKEventEditViewControllerImpl completeAndSave](self->_impl, "completeAndSave");
}

- (void)completeAndSaveWithContinueBlock:(id)a3
{
  -[EKEventEditViewControllerImpl completeAndSaveWithContinueBlock:](self->_impl, "completeAndSaveWithContinueBlock:", a3);
}

- (void)refreshStartAndEndDates
{
  -[EKEventEditViewControllerImpl refreshStartAndEndDates](self->_impl, "refreshStartAndEndDates");
}

- (void)refreshUIForUpdatedEvent
{
  -[EKEventEditViewControllerImpl refreshUIForUpdatedEvent](self->_impl, "refreshUIForUpdatedEvent");
}

- (BOOL)willPresentDialogOnSave
{
  return -[EKEventEditViewControllerImpl willPresentDialogOnSave](self->_impl, "willPresentDialogOnSave");
}

- (BOOL)hasUnsavedChanges
{
  return -[EKEventEditViewControllerImpl hasUnsavedChanges](self->_impl, "hasUnsavedChanges");
}

- (id)confirmDismissAlertController
{
  return (id)-[EKEventEditViewControllerImpl confirmDismissAlertController](self->_impl, "confirmDismissAlertController");
}

- (void)cancelEditingWithDelegateNotification:(BOOL)a3 forceCancel:(BOOL)a4
{
  -[EKEventEditViewControllerImpl cancelEditingWithDelegateNotification:forceCancel:](self->_impl, "cancelEditingWithDelegateNotification:forceCancel:", a3, a4);
}

+ (id)editViewControllerImplementation
{
  return +[SwappableViewControllerImplementationFactory eventEditViewControllerImplWithRemoteUI:](SwappableViewControllerImplementationFactory, "eventEditViewControllerImplWithRemoteUI:", 0);
}

- (BOOL)wantsManagement
{
  return 1;
}

- (BOOL)canManagePresentationStyle
{
  return 1;
}

- (void)configureAppearanceForSplitDayView
{
  void *v3;
  id v4;

  v4 = objc_alloc_init(MEMORY[0x1E0DC3A30]);
  objc_msgSend(v4, "configureWithOpaqueBackground");
  -[EKEventEditViewController navigationBar](self, "navigationBar");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setScrollEdgeAppearance:", v4);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_impl, 0);
}

+ (EKEventEditViewController)eventEditViewControllerWithEvent:(id)a3 eventStore:(id)a4 editViewDelegate:(id)a5
{
  id v7;
  id v8;
  id v9;
  EKEventEditViewController *v10;

  v7 = a5;
  v8 = a4;
  v9 = a3;
  v10 = -[EKEventEditViewController initWithNibName:bundle:]([EKEventEditViewController alloc], "initWithNibName:bundle:", 0, 0);
  -[EKEventEditViewController setEvent:](v10, "setEvent:", v9);

  -[EKEventEditViewController setEventStore:](v10, "setEventStore:", v8);
  -[EKEventEditViewController setEditViewDelegate:](v10, "setEditViewDelegate:", v7);

  return v10;
}

+ (void)registerIntegrationEditViewControllerCreator:(id)a3
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  id v7;

  v3 = a3;
  v4 = (void *)_integrationEditViewControllerCreators;
  v7 = v3;
  if (!_integrationEditViewControllerCreators)
  {
    v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v6 = (void *)_integrationEditViewControllerCreators;
    _integrationEditViewControllerCreators = (uint64_t)v5;

    v3 = v7;
    v4 = (void *)_integrationEditViewControllerCreators;
  }
  objc_msgSend(v4, "addObject:", v3);

}

+ (id)eventOrIntegrationViewControllerWithEvent:(id)a3 creationMethod:(unint64_t)a4 eventEditViewDelegate:(id)a5
{
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a5;
  if (objc_msgSend(v7, "isIntegrationEvent"))
  {
    v20 = 0u;
    v21 = 0u;
    v18 = 0u;
    v19 = 0u;
    v9 = (id)_integrationEditViewControllerCreators;
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v19;
LABEL_4:
      v13 = 0;
      while (1)
      {
        if (*(_QWORD *)v19 != v12)
          objc_enumerationMutation(v9);
        v14 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * v13);
        if ((objc_msgSend(v14, "useThisIntegrationEditorForEvent:", v7, (_QWORD)v18) & 1) != 0)
          break;
        if (v11 == ++v13)
        {
          v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
          if (v11)
            goto LABEL_4;
          goto LABEL_10;
        }
      }
      objc_msgSend(v14, "integrationViewControllerForEvent:eventEditViewDelegate:", v7, v8);
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      if (v15)
        goto LABEL_13;
    }
    else
    {
LABEL_10:

    }
  }
  objc_msgSend(v7, "eventStore", (_QWORD)v18);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  +[EKEventEditViewController eventEditViewControllerWithEvent:eventStore:editViewDelegate:](EKEventEditViewController, "eventEditViewControllerWithEvent:eventStore:editViewDelegate:", v7, v16, v8);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v15, "setEventCreationMethod:", a4);
LABEL_13:

  return v15;
}

@end
