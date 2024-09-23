@implementation EKCalendarChooser

- (EKCalendarChooser)initWithSelectionStyle:(int64_t)a3 displayStyle:(int64_t)a4 entityType:(unint64_t)a5 forEvent:(id)a6 eventStore:(id)a7 limitedToSource:(id)a8 showIdentityChooser:(BOOL)a9 showDelegateSetupCell:(BOOL)a10 showAccountStatus:(BOOL)a11
{
  id v17;
  id v18;
  id v19;
  EKCalendarChooser *v20;
  uint64_t v21;
  EKCalendarChooserImpl *impl;
  uint64_t v24;
  objc_super v25;

  v17 = a6;
  v18 = a7;
  v19 = a8;
  v25.receiver = self;
  v25.super_class = (Class)EKCalendarChooser;
  v20 = -[EKCalendarChooser initWithNibName:bundle:](&v25, sel_initWithNibName_bundle_, 0, 0);
  if (v20)
  {
    *(_WORD *)((char *)&v24 + 1) = __PAIR16__(a11, a10);
    LOBYTE(v24) = a9;
    +[SwappableViewControllerImplementationFactory calendarChooserImplWithSelectionStyle:displayStyle:entityType:forEvent:eventStore:limitedToSource:showIdentityChooser:showDelegateSetupCell:showAccountStatus:](SwappableViewControllerImplementationFactory, "calendarChooserImplWithSelectionStyle:displayStyle:entityType:forEvent:eventStore:limitedToSource:showIdentityChooser:showDelegateSetupCell:showAccountStatus:", a3, a4, a5, v17, v18, v19, v24);
    v21 = objc_claimAutoreleasedReturnValue();
    impl = v20->_impl;
    v20->_impl = (EKCalendarChooserImpl *)v21;

    -[EKCalendarChooser addChildViewController:](v20, "addChildViewController:", v20->_impl);
    -[EKCalendarChooserImpl didMoveToParentViewController:](v20->_impl, "didMoveToParentViewController:", v20);
    -[EKCalendarChooser commonInit](v20, "commonInit");
  }

  return v20;
}

- (id)initWithSelectionStyle:(EKCalendarChooserSelectionStyle)style displayStyle:(EKCalendarChooserDisplayStyle)displayStyle entityType:(EKEntityType)entityType eventStore:(EKEventStore *)eventStore
{
  uint64_t v7;

  BYTE2(v7) = 0;
  LOWORD(v7) = 0;
  return -[EKCalendarChooser initWithSelectionStyle:displayStyle:entityType:forEvent:eventStore:limitedToSource:showIdentityChooser:showDelegateSetupCell:showAccountStatus:](self, "initWithSelectionStyle:displayStyle:entityType:forEvent:eventStore:limitedToSource:showIdentityChooser:showDelegateSetupCell:showAccountStatus:", style, displayStyle, entityType, 0, eventStore, 0, v7);
}

- (id)initWithSelectionStyle:(EKCalendarChooserSelectionStyle)selectionStyle displayStyle:(EKCalendarChooserDisplayStyle)displayStyle eventStore:(EKEventStore *)eventStore
{
  uint64_t v6;

  BYTE2(v6) = 0;
  LOWORD(v6) = 0;
  return -[EKCalendarChooser initWithSelectionStyle:displayStyle:entityType:forEvent:eventStore:limitedToSource:showIdentityChooser:showDelegateSetupCell:showAccountStatus:](self, "initWithSelectionStyle:displayStyle:entityType:forEvent:eventStore:limitedToSource:showIdentityChooser:showDelegateSetupCell:showAccountStatus:", selectionStyle, displayStyle, 0, 0, eventStore, 0, v6);
}

- (EKCalendarChooser)initWithRemoteUI:(BOOL)a3 selectionStyle:(int64_t)a4 displayStyle:(int64_t)a5 entityType:(unint64_t)a6 forEvent:(id)a7 eventStore:(id)a8 limitedToSource:(id)a9 showIdentityChooser:(BOOL)a10 showDelegateSetupCell:(BOOL)a11 showAccountStatus:(BOOL)a12
{
  _BOOL8 v16;
  id v18;
  id v19;
  id v20;
  EKCalendarChooser *v21;
  uint64_t v22;
  EKCalendarChooserImpl *impl;
  uint64_t v25;
  objc_super v26;

  v16 = a3;
  v18 = a7;
  v19 = a8;
  v20 = a9;
  v26.receiver = self;
  v26.super_class = (Class)EKCalendarChooser;
  v21 = -[EKCalendarChooser initWithNibName:bundle:](&v26, sel_initWithNibName_bundle_, 0, 0);
  if (v21)
  {
    *(_WORD *)((char *)&v25 + 1) = __PAIR16__(a12, a11);
    LOBYTE(v25) = a10;
    +[SwappableViewControllerImplementationFactory calendarChooserImplWithRemoteUI:selectionStyle:displayStyle:entityType:forEvent:eventStore:limitedToSource:showIdentityChooser:showDelegateSetupCell:showAccountStatus:](SwappableViewControllerImplementationFactory, "calendarChooserImplWithRemoteUI:selectionStyle:displayStyle:entityType:forEvent:eventStore:limitedToSource:showIdentityChooser:showDelegateSetupCell:showAccountStatus:", v16, a4, a5, a6, v18, v19, v20, v25);
    v22 = objc_claimAutoreleasedReturnValue();
    impl = v21->_impl;
    v21->_impl = (EKCalendarChooserImpl *)v22;

    -[EKCalendarChooser addChildViewController:](v21, "addChildViewController:", v21->_impl);
    -[EKCalendarChooserImpl didMoveToParentViewController:](v21->_impl, "didMoveToParentViewController:", v21);
    -[EKCalendarChooser commonInit](v21, "commonInit");
  }

  return v21;
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
  v28.super_class = (Class)EKCalendarChooser;
  -[EKCalendarChooser loadView](&v28, sel_loadView);
  -[EKCalendarChooser view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKCalendarChooserImpl view](self->_impl, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addSubview:", v4);

  -[EKCalendarChooserImpl view](self->_impl, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  v18 = (void *)MEMORY[0x1E0CB3718];
  -[EKCalendarChooserImpl view](self->_impl, "view");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "leadingAnchor");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKCalendarChooser view](self, "view");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "leadingAnchor");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "constraintEqualToAnchor:", v24);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v29[0] = v23;
  -[EKCalendarChooserImpl view](self->_impl, "view");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "trailingAnchor");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKCalendarChooser view](self, "view");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "trailingAnchor");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "constraintEqualToAnchor:", v19);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v29[1] = v17;
  -[EKCalendarChooserImpl view](self->_impl, "view");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "topAnchor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKCalendarChooser view](self, "view");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "topAnchor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "constraintEqualToAnchor:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v29[2] = v9;
  -[EKCalendarChooserImpl view](self->_impl, "view");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "bottomAnchor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKCalendarChooser view](self, "view");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "bottomAnchor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "constraintEqualToAnchor:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v29[3] = v14;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v29, 4);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "activateConstraints:", v15);

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
  v11.super_class = (Class)EKCalendarChooser;
  -[EKCalendarChooser viewIsAppearing:](&v11, sel_viewIsAppearing_, a3);
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
    -[EKCalendarChooser view](self, "view");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "window");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setTintColor:", v8);

  }
}

- (CGSize)preferredContentSize
{
  double v2;
  double v3;
  CGSize result;

  -[EKCalendarChooserImpl preferredContentSize](self->_impl, "preferredContentSize");
  result.height = v3;
  result.width = v2;
  return result;
}

- (unint64_t)supportedInterfaceOrientations
{
  return -[EKCalendarChooserImpl supportedInterfaceOrientations](self->_impl, "supportedInterfaceOrientations");
}

- (EKCalendarChooserSelectionStyle)selectionStyle
{
  return -[EKCalendarChooserImpl selectionStyle](self->_impl, "selectionStyle");
}

- (id)delegate
{
  return (id)-[EKCalendarChooserImpl delegate](self->_impl, "delegate");
}

- (void)setDelegate:(id)delegate
{
  -[EKCalendarChooserImpl setDelegate:](self->_impl, "setDelegate:", delegate);
}

- (BOOL)showsDoneButton
{
  return -[EKCalendarChooserImpl showsDoneButton](self->_impl, "showsDoneButton");
}

- (void)setShowsDoneButton:(BOOL)showsDoneButton
{
  -[EKCalendarChooserImpl setShowsDoneButton:](self->_impl, "setShowsDoneButton:", showsDoneButton);
}

- (BOOL)showsCancelButton
{
  return -[EKCalendarChooserImpl showsCancelButton](self->_impl, "showsCancelButton");
}

- (void)setShowsCancelButton:(BOOL)showsCancelButton
{
  -[EKCalendarChooserImpl setShowsCancelButton:](self->_impl, "setShowsCancelButton:", showsCancelButton);
}

- (NSSet)selectedCalendars
{
  return (NSSet *)-[EKCalendarChooserImpl selectedCalendars](self->_impl, "selectedCalendars");
}

- (void)setSelectedCalendars:(NSSet *)selectedCalendars
{
  -[EKCalendarChooserImpl setSelectedCalendars:](self->_impl, "setSelectedCalendars:", selectedCalendars);
}

- (NSSet)collapsedSectionIdentifiers
{
  return (NSSet *)-[EKCalendarChooserImpl collapsedSectionIdentifiers](self->_impl, "collapsedSectionIdentifiers");
}

- (void)setCollapsedSectionIdentifiers:(id)a3
{
  -[EKCalendarChooserImpl setCollapsedSectionIdentifiers:](self->_impl, "setCollapsedSectionIdentifiers:", a3);
}

- (void)setShouldOverrideAuthorizationStatus:(BOOL)a3 withRemoteUIStatus:(int64_t)a4 displayStyle:(int64_t)a5
{
  -[EKCalendarChooserImpl setShouldOverrideAuthorizationStatus:withRemoteUIStatus:displayStyle:](self->_impl, "setShouldOverrideAuthorizationStatus:withRemoteUIStatus:displayStyle:", a3, a4, a5);
}

- (BOOL)showDetailAccessories
{
  return -[EKCalendarChooserImpl showDetailAccessories](self->_impl, "showDetailAccessories");
}

- (void)setShowDetailAccessories:(BOOL)a3
{
  -[EKCalendarChooserImpl setShowDetailAccessories:](self->_impl, "setShowDetailAccessories:", a3);
}

- (int64_t)chooserMode
{
  return -[EKCalendarChooserImpl chooserMode](self->_impl, "chooserMode");
}

- (void)setChooserMode:(int64_t)a3
{
  -[EKCalendarChooserImpl setChooserMode:](self->_impl, "setChooserMode:", a3);
}

- (BOOL)disableCalendarsUnselectedByFocus
{
  return -[EKCalendarChooserImpl disableCalendarsUnselectedByFocus](self->_impl, "disableCalendarsUnselectedByFocus");
}

- (void)setDisableCalendarsUnselectedByFocus:(BOOL)a3
{
  -[EKCalendarChooserImpl setDisableCalendarsUnselectedByFocus:](self->_impl, "setDisableCalendarsUnselectedByFocus:", a3);
}

- (BOOL)allowsPullToRefresh
{
  return -[EKCalendarChooserImpl allowsPullToRefresh](self->_impl, "allowsPullToRefresh");
}

- (void)setAllowsPullToRefresh:(BOOL)a3
{
  -[EKCalendarChooserImpl setAllowsPullToRefresh:](self->_impl, "setAllowsPullToRefresh:", a3);
}

- (EKCalendar)selectedCalendar
{
  return (EKCalendar *)-[EKCalendarChooserImpl selectedCalendar](self->_impl, "selectedCalendar");
}

- (void)setSelectedCalendar:(id)a3
{
  -[EKCalendarChooserImpl setSelectedCalendar:](self->_impl, "setSelectedCalendar:", a3);
}

- (BOOL)disableCalendarEditing
{
  return -[EKCalendarChooserImpl disableCalendarEditing](self->_impl, "disableCalendarEditing");
}

- (void)setDisableCalendarEditing:(BOOL)a3
{
  -[EKCalendarChooserImpl setDisableCalendarEditing:](self->_impl, "setDisableCalendarEditing:", a3);
}

- (BOOL)showsDeclinedEventsSetting
{
  return -[EKCalendarChooserImpl showsDeclinedEventsSetting](self->_impl, "showsDeclinedEventsSetting");
}

- (void)setShowsDeclinedEventsSetting:(BOOL)a3
{
  -[EKCalendarChooserImpl setShowsDeclinedEventsSetting:](self->_impl, "setShowsDeclinedEventsSetting:", a3);
}

- (BOOL)showsCompletedRemindersSetting
{
  return -[EKCalendarChooserImpl showsCompletedRemindersSetting](self->_impl, "showsCompletedRemindersSetting");
}

- (void)setShowsCompletedRemindersSetting:(BOOL)a3
{
  -[EKCalendarChooserImpl setShowsCompletedRemindersSetting:](self->_impl, "setShowsCompletedRemindersSetting:", a3);
}

- (EKEventStore)eventStore
{
  return (EKEventStore *)-[EKCalendarChooserImpl eventStore](self->_impl, "eventStore");
}

- (int)explanatoryTextMode
{
  return -[EKCalendarChooserImpl explanatoryTextMode](self->_impl, "explanatoryTextMode");
}

- (void)setExplanatoryTextMode:(int)a3
{
  -[EKCalendarChooserImpl setExplanatoryTextMode:](self->_impl, "setExplanatoryTextMode:", *(_QWORD *)&a3);
}

- (BOOL)showAccountStatus
{
  return -[EKCalendarChooserImpl showAccountStatus](self->_impl, "showAccountStatus");
}

- (void)setShowAccountStatus:(BOOL)a3
{
  -[EKCalendarChooserImpl setShowAccountStatus:](self->_impl, "setShowAccountStatus:", a3);
}

- (BOOL)onlyShowUnmanagedAccounts
{
  return -[EKCalendarChooserImpl onlyShowUnmanagedAccounts](self->_impl, "onlyShowUnmanagedAccounts");
}

- (void)setOnlyShowUnmanagedAccounts:(BOOL)a3
{
  -[EKCalendarChooserImpl setOnlyShowUnmanagedAccounts:](self->_impl, "setOnlyShowUnmanagedAccounts:", a3);
}

- (void)showAllButtonPressed
{
  -[EKCalendarChooserImpl showAllButtonPressed](self->_impl, "showAllButtonPressed");
}

- (BOOL)allSelected
{
  return -[EKCalendarChooserImpl allSelected](self->_impl, "allSelected");
}

- (void)focusModeConfigurationChanged
{
  -[EKCalendarChooserImpl focusModeConfigurationChanged](self->_impl, "focusModeConfigurationChanged");
}

- (id)centeredCalendar
{
  return (id)-[EKCalendarChooserImpl centeredCalendar](self->_impl, "centeredCalendar");
}

- (void)centerOnCalendar:(id)a3
{
  -[EKCalendarChooserImpl centerOnCalendar:](self->_impl, "centerOnCalendar:", a3);
}

- (id)displayedEditor
{
  return (id)-[EKCalendarChooserImpl displayedEditor](self->_impl, "displayedEditor");
}

- (void)redisplayEditor:(id)a3 completion:(id)a4
{
  -[EKCalendarChooserImpl redisplayEditor:completion:](self->_impl, "redisplayEditor:completion:", a3, a4);
}

- (id)sourceForSelectedIdentity
{
  return (id)-[EKCalendarChooserImpl sourceForSelectedIdentity](self->_impl, "sourceForSelectedIdentity");
}

- (void)identityChanged:(id)a3
{
  -[EKCalendarChooserImpl identityChanged:](self->_impl, "identityChanged:", a3);
}

- (void)showAddSubscribedCalendarWithURL:(id)a3
{
  -[EKCalendarChooserImpl showAddSubscribedCalendarWithURL:](self->_impl, "showAddSubscribedCalendarWithURL:", a3);
}

- (void)openAddRegularCalendarWithTitle:(id)a3
{
  -[EKCalendarChooserImpl openAddRegularCalendarWithTitle:](self->_impl, "openAddRegularCalendarWithTitle:", a3);
}

- (void)showCalendar:(id)a3 enableDoneInitially:(BOOL)a4
{
  -[EKCalendarChooserImpl showCalendar:enableDoneInitially:](self->_impl, "showCalendar:enableDoneInitially:", a3, a4);
}

- (void)setEventStore:(id)a3
{
  objc_storeStrong((id *)&self->_eventStore, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_eventStore, 0);
  objc_storeStrong((id *)&self->_impl, 0);
}

@end
