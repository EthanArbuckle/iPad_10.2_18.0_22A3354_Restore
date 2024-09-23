@implementation EKEventViewController

- (EKEventViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  EKEventViewController *v4;
  uint64_t v5;
  EKEventViewControllerImpl *impl;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)EKEventViewController;
  v4 = -[EKEventViewController initWithNibName:bundle:](&v8, sel_initWithNibName_bundle_, a3, a4);
  if (v4)
  {
    +[SwappableViewControllerImplementationFactory eventViewControllerImpl](SwappableViewControllerImplementationFactory, "eventViewControllerImpl");
    v5 = objc_claimAutoreleasedReturnValue();
    impl = v4->_impl;
    v4->_impl = (EKEventViewControllerImpl *)v5;

    -[EKEventViewController addChildViewController:](v4, "addChildViewController:", v4->_impl);
    -[EKEventViewControllerImpl didMoveToParentViewController:](v4->_impl, "didMoveToParentViewController:", v4);
    -[EKEventViewController commonInit](v4, "commonInit");
  }
  return v4;
}

- (EKEventViewController)initWithRemoteUI:(BOOL)a3
{
  _BOOL8 v3;
  EKEventViewController *v4;
  uint64_t v5;
  EKEventViewControllerImpl *impl;
  objc_super v8;

  v3 = a3;
  v8.receiver = self;
  v8.super_class = (Class)EKEventViewController;
  v4 = -[EKEventViewController initWithNibName:bundle:](&v8, sel_initWithNibName_bundle_, 0, 0);
  if (v4)
  {
    +[SwappableViewControllerImplementationFactory eventViewControllerImplWithRemoteUI:](SwappableViewControllerImplementationFactory, "eventViewControllerImplWithRemoteUI:", v3);
    v5 = objc_claimAutoreleasedReturnValue();
    impl = v4->_impl;
    v4->_impl = (EKEventViewControllerImpl *)v5;

    -[EKEventViewController addChildViewController:](v4, "addChildViewController:", v4->_impl);
    -[EKEventViewControllerImpl didMoveToParentViewController:](v4->_impl, "didMoveToParentViewController:", v4);
    -[EKEventViewController commonInit](v4, "commonInit");
  }
  return v4;
}

- (void)commonInit
{
  EKUILogInitIfNeeded();
  -[EKEventViewController setCalendarPreviewIsInlineDayView:](self, "setCalendarPreviewIsInlineDayView:", 1);
  -[EKEventViewController setInlineDayViewRespectsSelectedCalendarsFilter:](self, "setInlineDayViewRespectsSelectedCalendarsFilter:", 1);
  -[EKEventViewController setAllowsSubitems:](self, "setAllowsSubitems:", 1);
  -[EKEventViewController setAllowsInviteResponses:](self, "setAllowsInviteResponses:", 1);
  -[EKEventViewController setShowsDoneButton:](self, "setShowsDoneButton:", 1);
  -[EKEventViewController setEditorShowTransition:](self, "setEditorShowTransition:", 8);
  -[EKEventViewController setEditorHideTransition:](self, "setEditorHideTransition:", 9);
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
  v28.super_class = (Class)EKEventViewController;
  -[EKEventViewController loadView](&v28, sel_loadView);
  -[EKEventViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKEventViewControllerImpl view](self->_impl, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addSubview:", v4);

  -[EKEventViewControllerImpl view](self->_impl, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  v18 = (void *)MEMORY[0x1E0CB3718];
  -[EKEventViewControllerImpl view](self->_impl, "view");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "leadingAnchor");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKEventViewController view](self, "view");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "leadingAnchor");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "constraintEqualToAnchor:", v24);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v29[0] = v23;
  -[EKEventViewControllerImpl view](self->_impl, "view");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "trailingAnchor");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKEventViewController view](self, "view");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "trailingAnchor");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "constraintEqualToAnchor:", v19);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v29[1] = v17;
  -[EKEventViewControllerImpl view](self->_impl, "view");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "topAnchor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKEventViewController view](self, "view");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "topAnchor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "constraintEqualToAnchor:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v29[2] = v9;
  -[EKEventViewControllerImpl view](self->_impl, "view");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "bottomAnchor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKEventViewController view](self, "view");
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

- (void)viewDidLoad
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)EKEventViewController;
  -[EKEventViewController viewDidLoad](&v2, sel_viewDidLoad);
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
  v11.super_class = (Class)EKEventViewController;
  -[EKEventViewController viewIsAppearing:](&v11, sel_viewIsAppearing_, a3);
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
    -[EKEventViewController view](self, "view");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "window");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setTintColor:", v8);

  }
  if (objc_msgSend(MEMORY[0x1E0D0C2E8], "currentProcessIsFirstPartyCalendarApp"))
    -[UIViewController ekui_adjustNavAndToolBarToTransparentStyles](self, "ekui_adjustNavAndToolBarToTransparentStyles");
}

- (void)viewDidAppear:(BOOL)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)EKEventViewController;
  -[EKEventViewController viewDidAppear:](&v3, sel_viewDidAppear_, a3);
  if (objc_msgSend((id)*MEMORY[0x1E0DC4730], "isRunningTest"))
    dispatch_async(MEMORY[0x1E0C80D38], &__block_literal_global_57);
}

void __39__EKEventViewController_viewDidAppear___block_invoke()
{
  id v0;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v0 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "postNotificationName:object:", CFSTR("EKEventViewControllerDidAppearNotification"), 0);

}

- (CGSize)preferredContentSize
{
  double v2;
  double v3;
  CGSize result;

  -[EKEventViewControllerImpl preferredContentSize](self->_impl, "preferredContentSize");
  result.height = v3;
  result.width = v2;
  return result;
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
  v9.super_class = (Class)EKEventViewController;
  v4 = a3;
  -[EKEventViewController preferredContentSizeDidChangeForChildContentContainer:](&v9, sel_preferredContentSizeDidChangeForChildContentContainer_, v4);
  objc_msgSend(v4, "preferredContentSize", v9.receiver, v9.super_class);
  v6 = v5;
  v8 = v7;

  -[EKEventViewController setPreferredContentSize:](self, "setPreferredContentSize:", v6, v8);
}

- (unint64_t)supportedInterfaceOrientations
{
  void *v2;
  _BOOL4 IsRegularInViewHierarchy;

  -[EKEventViewController view](self, "view");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  IsRegularInViewHierarchy = EKUICurrentWidthSizeClassIsRegularInViewHierarchy(v2);

  if (IsRegularInViewHierarchy)
    return 30;
  else
    return 26;
}

- (void)setEventEditViewPresented:(BOOL)a3
{
  -[EKEventViewControllerImpl setEventEditViewPresented:](self->_impl, "setEventEditViewPresented:", a3);
}

- (BOOL)eventEditViewPresented
{
  return -[EKEventViewControllerImpl eventEditViewPresented](self->_impl, "eventEditViewPresented");
}

- (void)setEvent:(EKEvent *)event
{
  -[EKEventViewControllerImpl setEvent:](self->_impl, "setEvent:", event);
}

- (EKEvent)event
{
  return (EKEvent *)-[EKEventViewControllerImpl event](self->_impl, "event");
}

- (void)setAllowsEditing:(BOOL)allowsEditing
{
  -[EKEventViewControllerImpl setAllowsEditing:](self->_impl, "setAllowsEditing:", allowsEditing);
}

- (BOOL)allowsEditing
{
  return -[EKEventViewControllerImpl allowsEditing](self->_impl, "allowsEditing");
}

- (void)setDelegate:(id)delegate
{
  -[EKEventViewControllerImpl setDelegate:](self->_impl, "setDelegate:", delegate);
}

- (id)delegate
{
  return (id)-[EKEventViewControllerImpl delegate](self->_impl, "delegate");
}

- (void)setAllowsCalendarPreview:(BOOL)allowsCalendarPreview
{
  -[EKEventViewControllerImpl setAllowsCalendarPreview:](self->_impl, "setAllowsCalendarPreview:", allowsCalendarPreview);
}

- (BOOL)allowsCalendarPreview
{
  return -[EKEventViewControllerImpl allowsCalendarPreview](self->_impl, "allowsCalendarPreview");
}

- (void)setShouldOverrideAuthorizationStatus:(BOOL)a3 withRemoteUIStatus:(int64_t)a4
{
  -[EKEventViewControllerImpl setShouldOverrideAuthorizationStatus:withRemoteUIStatus:](self->_impl, "setShouldOverrideAuthorizationStatus:withRemoteUIStatus:", a3, a4);
}

- (void)setCalendarPreviewIsInlineDayView:(BOOL)a3
{
  -[EKEventViewControllerImpl setCalendarPreviewIsInlineDayView:](self->_impl, "setCalendarPreviewIsInlineDayView:", a3);
}

- (BOOL)calendarPreviewIsInlineDayView
{
  return -[EKEventViewControllerImpl calendarPreviewIsInlineDayView](self->_impl, "calendarPreviewIsInlineDayView");
}

- (void)setInlineDayViewRespectsSelectedCalendarsFilter:(BOOL)a3
{
  -[EKEventViewControllerImpl setInlineDayViewRespectsSelectedCalendarsFilter:](self->_impl, "setInlineDayViewRespectsSelectedCalendarsFilter:", a3);
}

- (BOOL)inlineDayViewRespectsSelectedCalendarsFilter
{
  return -[EKEventViewControllerImpl inlineDayViewRespectsSelectedCalendarsFilter](self->_impl, "inlineDayViewRespectsSelectedCalendarsFilter");
}

- (void)setICSPreview:(BOOL)a3
{
  -[EKEventViewControllerImpl setICSPreview:](self->_impl, "setICSPreview:", a3);
}

- (BOOL)isICSPreview
{
  return -[EKEventViewControllerImpl isICSPreview](self->_impl, "isICSPreview");
}

- (void)setAllowsInviteResponses:(BOOL)a3
{
  -[EKEventViewControllerImpl setAllowsInviteResponses:](self->_impl, "setAllowsInviteResponses:", a3);
}

- (BOOL)allowsInviteResponses
{
  return -[EKEventViewControllerImpl allowsInviteResponses](self->_impl, "allowsInviteResponses");
}

- (void)setShowsAddToCalendarForICSPreview:(BOOL)a3
{
  -[EKEventViewControllerImpl setShowsAddToCalendarForICSPreview:](self->_impl, "setShowsAddToCalendarForICSPreview:", a3);
}

- (BOOL)showsAddToCalendarForICSPreview
{
  return -[EKEventViewControllerImpl showsAddToCalendarForICSPreview](self->_impl, "showsAddToCalendarForICSPreview");
}

- (void)setShowsUpdateCalendarForICSPreview:(BOOL)a3
{
  -[EKEventViewControllerImpl setShowsUpdateCalendarForICSPreview:](self->_impl, "setShowsUpdateCalendarForICSPreview:", a3);
}

- (BOOL)showsUpdateCalendarForICSPreview
{
  return -[EKEventViewControllerImpl showsUpdateCalendarForICSPreview](self->_impl, "showsUpdateCalendarForICSPreview");
}

- (void)setShowsDeleteForICSPreview:(BOOL)a3
{
  -[EKEventViewControllerImpl setShowsDeleteForICSPreview:](self->_impl, "setShowsDeleteForICSPreview:", a3);
}

- (BOOL)showsDeleteForICSPreview
{
  return -[EKEventViewControllerImpl showsDeleteForICSPreview](self->_impl, "showsDeleteForICSPreview");
}

- (void)setAllowsSubitems:(BOOL)a3
{
  -[EKEventViewControllerImpl setAllowsSubitems:](self->_impl, "setAllowsSubitems:", a3);
}

- (BOOL)allowsSubitems
{
  return -[EKEventViewControllerImpl allowsSubitems](self->_impl, "allowsSubitems");
}

- (void)setShowsDoneButton:(BOOL)a3
{
  -[EKEventViewControllerImpl setShowsDoneButton:](self->_impl, "setShowsDoneButton:", a3);
}

- (BOOL)showsDoneButton
{
  return -[EKEventViewControllerImpl showsDoneButton](self->_impl, "showsDoneButton");
}

- (void)setShowsOutOfDateMessage:(BOOL)a3
{
  -[EKEventViewControllerImpl setShowsOutOfDateMessage:](self->_impl, "setShowsOutOfDateMessage:", a3);
}

- (BOOL)showsOutOfDateMessage
{
  return -[EKEventViewControllerImpl showsOutOfDateMessage](self->_impl, "showsOutOfDateMessage");
}

- (void)setShowsDelegatorMessage:(BOOL)a3
{
  -[EKEventViewControllerImpl setShowsDelegatorMessage:](self->_impl, "setShowsDelegatorMessage:", a3);
}

- (BOOL)showsDelegatorMessage
{
  return -[EKEventViewControllerImpl showsDelegatorMessage](self->_impl, "showsDelegatorMessage");
}

- (void)setShowsDelegateMessage:(BOOL)a3
{
  -[EKEventViewControllerImpl setShowsDelegateMessage:](self->_impl, "setShowsDelegateMessage:", a3);
}

- (BOOL)showsDelegateMessage
{
  return -[EKEventViewControllerImpl showsDelegateMessage](self->_impl, "showsDelegateMessage");
}

- (void)setShowsDetectedConferenceItem:(BOOL)a3
{
  -[EKEventViewControllerImpl setShowsDetectedConferenceItem:](self->_impl, "setShowsDetectedConferenceItem:", a3);
}

- (BOOL)showsDetectedConferenceItem
{
  return -[EKEventViewControllerImpl showsDetectedConferenceItem](self->_impl, "showsDetectedConferenceItem");
}

- (void)setMinimalMode:(BOOL)a3
{
  -[EKEventViewControllerImpl setMinimalMode:](self->_impl, "setMinimalMode:", a3);
}

- (BOOL)minimalMode
{
  return -[EKEventViewControllerImpl minimalMode](self->_impl, "minimalMode");
}

- (void)setNoninteractivePlatterMode:(BOOL)a3
{
  -[EKEventViewControllerImpl setNoninteractivePlatterMode:](self->_impl, "setNoninteractivePlatterMode:", a3);
}

- (BOOL)noninteractivePlatterMode
{
  return -[EKEventViewControllerImpl noninteractivePlatterMode](self->_impl, "noninteractivePlatterMode");
}

- (void)setIsLargeDayView:(BOOL)a3
{
  -[EKEventViewControllerImpl setIsLargeDayView:](self->_impl, "setIsLargeDayView:", a3);
}

- (BOOL)isLargeDayView
{
  return -[EKEventViewControllerImpl isLargeDayView](self->_impl, "isLargeDayView");
}

- (void)setEditorShowTransition:(int)a3
{
  -[EKEventViewControllerImpl setEditorShowTransition:](self->_impl, "setEditorShowTransition:", *(_QWORD *)&a3);
}

- (int)editorShowTransition
{
  return -[EKEventViewControllerImpl editorShowTransition](self->_impl, "editorShowTransition");
}

- (void)setEditorHideTransition:(int)a3
{
  -[EKEventViewControllerImpl setEditorHideTransition:](self->_impl, "setEditorHideTransition:", *(_QWORD *)&a3);
}

- (int)editorHideTransition
{
  return -[EKEventViewControllerImpl editorHideTransition](self->_impl, "editorHideTransition");
}

- (UIScrollView)eventDetailsScrollView
{
  return (UIScrollView *)-[EKEventViewControllerImpl eventDetailsScrollView](self->_impl, "eventDetailsScrollView");
}

- (UIViewController)eventDetailsViewController
{
  return (UIViewController *)-[EKEventViewControllerImpl eventDetailsViewController](self->_impl, "eventDetailsViewController");
}

- (void)setContext:(id)a3
{
  -[EKEventViewControllerImpl setContext:](self->_impl, "setContext:", a3);
}

- (NSDictionary)context
{
  return (NSDictionary *)-[EKEventViewControllerImpl context](self->_impl, "context");
}

- (void)setNavigationDelegate:(id)a3
{
  -[EKEventViewControllerImpl setNavigationDelegate:](self->_impl, "setNavigationDelegate:", a3);
}

- (EKUIViewControllerNavigationDelegate)navigationDelegate
{
  return (EKUIViewControllerNavigationDelegate *)-[EKEventViewControllerImpl navigationDelegate](self->_impl, "navigationDelegate");
}

- (void)_performEditKeyCommand
{
  -[EKEventViewControllerImpl _performEditKeyCommand](self->_impl, "_performEditKeyCommand");
}

- (void)doneButtonTapped
{
  -[EKEventViewControllerImpl doneButtonTapped](self->_impl, "doneButtonTapped");
}

- (void)editButtonTapped
{
  -[EKEventViewControllerImpl editButtonTapped](self->_impl, "editButtonTapped");
}

- (void)openAttendeesDetailItem
{
  -[EKEventViewControllerImpl openAttendeesDetailItem](self->_impl, "openAttendeesDetailItem");
}

- (void)setNeedsReload
{
  -[EKEventViewControllerImpl setNeedsReload](self->_impl, "setNeedsReload");
}

- (void)fullReloadWithNewEvent:(id)a3
{
  -[EKEventViewControllerImpl fullReloadWithNewEvent:](self->_impl, "fullReloadWithNewEvent:", a3);
}

- (void)performAddToCalendar
{
  -[EKEventViewControllerImpl performAddToCalendar](self->_impl, "performAddToCalendar");
}

- (BOOL)canManagePresentationStyle
{
  return 1;
}

- (BOOL)wantsManagement
{
  return 1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_impl, 0);
}

@end
