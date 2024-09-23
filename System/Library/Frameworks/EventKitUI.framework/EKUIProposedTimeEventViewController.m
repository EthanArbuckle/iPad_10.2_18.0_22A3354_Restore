@implementation EKUIProposedTimeEventViewController

- (EKUIProposedTimeEventViewController)initWithProposedTimeAttendee:(id)a3
{
  id v4;
  EKUIProposedTimeEventViewController *v5;
  uint64_t v6;
  EKUIProposedTimeEventViewControllerImpl *impl;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)EKUIProposedTimeEventViewController;
  v5 = -[EKUIProposedTimeEventViewController init](&v9, sel_init);
  if (v5)
  {
    +[SwappableViewControllerImplementationFactory proposedTimeEventViewControllerImpl](SwappableViewControllerImplementationFactory, "proposedTimeEventViewControllerImpl");
    v6 = objc_claimAutoreleasedReturnValue();
    impl = v5->_impl;
    v5->_impl = (EKUIProposedTimeEventViewControllerImpl *)v6;

    -[EKUIProposedTimeEventViewController addChildViewController:](v5, "addChildViewController:", v5->_impl);
    -[EKUIProposedTimeEventViewControllerImpl didMoveToParentViewController:](v5->_impl, "didMoveToParentViewController:", v5);
    -[EKUIProposedTimeEventViewControllerImpl setProposedTimeAttendee:](v5->_impl, "setProposedTimeAttendee:", v4);
    -[EKUIProposedTimeEventViewControllerImpl setCalendarPreviewIsInlineDayView:](v5->_impl, "setCalendarPreviewIsInlineDayView:", 1);
    -[EKUIProposedTimeEventViewControllerImpl setAllowsEditing:](v5->_impl, "setAllowsEditing:", 1);
    -[EKUIProposedTimeEventViewControllerImpl setAllowsCalendarPreview:](v5->_impl, "setAllowsCalendarPreview:", 1);
    -[EKUIProposedTimeEventViewControllerImpl setShowsDetectedConferenceItem:](v5->_impl, "setShowsDetectedConferenceItem:", 1);
  }

  return v5;
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
  v28.super_class = (Class)EKUIProposedTimeEventViewController;
  -[EKUIProposedTimeEventViewController loadView](&v28, sel_loadView);
  -[EKUIProposedTimeEventViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKUIProposedTimeEventViewControllerImpl view](self->_impl, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addSubview:", v4);

  -[EKUIProposedTimeEventViewControllerImpl view](self->_impl, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  v18 = (void *)MEMORY[0x1E0CB3718];
  -[EKUIProposedTimeEventViewControllerImpl view](self->_impl, "view");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "leadingAnchor");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKUIProposedTimeEventViewController view](self, "view");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "leadingAnchor");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "constraintEqualToAnchor:", v24);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v29[0] = v23;
  -[EKUIProposedTimeEventViewControllerImpl view](self->_impl, "view");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "trailingAnchor");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKUIProposedTimeEventViewController view](self, "view");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "trailingAnchor");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "constraintEqualToAnchor:", v19);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v29[1] = v17;
  -[EKUIProposedTimeEventViewControllerImpl view](self->_impl, "view");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "topAnchor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKUIProposedTimeEventViewController view](self, "view");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "topAnchor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "constraintEqualToAnchor:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v29[2] = v9;
  -[EKUIProposedTimeEventViewControllerImpl view](self->_impl, "view");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "bottomAnchor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKUIProposedTimeEventViewController view](self, "view");
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

- (CGSize)preferredContentSize
{
  double v2;
  double v3;
  CGSize result;

  -[EKUIProposedTimeEventViewControllerImpl preferredContentSize](self->_impl, "preferredContentSize");
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
  v9.super_class = (Class)EKUIProposedTimeEventViewController;
  v4 = a3;
  -[EKUIProposedTimeEventViewController preferredContentSizeDidChangeForChildContentContainer:](&v9, sel_preferredContentSizeDidChangeForChildContentContainer_, v4);
  objc_msgSend(v4, "preferredContentSize", v9.receiver, v9.super_class);
  v6 = v5;
  v8 = v7;

  -[EKUIProposedTimeEventViewController setPreferredContentSize:](self, "setPreferredContentSize:", v6, v8);
}

- (void)viewDidAppear:(BOOL)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)EKUIProposedTimeEventViewController;
  -[EKUIProposedTimeEventViewController viewDidAppear:](&v3, sel_viewDidAppear_, a3);
  if (objc_msgSend((id)*MEMORY[0x1E0DC4730], "isRunningTest"))
    dispatch_async(MEMORY[0x1E0C80D38], &__block_literal_global_61);
}

void __53__EKUIProposedTimeEventViewController_viewDidAppear___block_invoke()
{
  id v0;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v0 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "postNotificationName:object:", CFSTR("EKEventViewControllerDidAppearNotification"), 0);

}

- (unint64_t)supportedInterfaceOrientations
{
  void *v2;
  _BOOL4 IsRegularInViewHierarchy;

  -[EKUIProposedTimeEventViewController view](self, "view");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  IsRegularInViewHierarchy = EKUICurrentWidthSizeClassIsRegularInViewHierarchy(v2);

  if (IsRegularInViewHierarchy)
    return 30;
  else
    return 26;
}

- (void)setDelegate:(id)a3
{
  -[EKUIProposedTimeEventViewControllerImpl setDelegate:](self->_impl, "setDelegate:", a3);
}

- (EKEventViewDelegate)delegate
{
  return (EKEventViewDelegate *)-[EKUIProposedTimeEventViewControllerImpl delegate](self->_impl, "delegate");
}

- (void)setEvent:(id)a3
{
  -[EKUIProposedTimeEventViewControllerImpl setEvent:](self->_impl, "setEvent:", a3);
}

- (EKEvent)event
{
  return (EKEvent *)-[EKUIProposedTimeEventViewControllerImpl event](self->_impl, "event");
}

- (EKCalendarEventInvitationNotificationAttendee)proposedTimeAttendee
{
  return (EKCalendarEventInvitationNotificationAttendee *)-[EKUIProposedTimeEventViewControllerImpl proposedTimeAttendee](self->_impl, "proposedTimeAttendee");
}

- (void)setCompletionBlock:(id)a3
{
  -[EKUIProposedTimeEventViewControllerImpl setCompletionBlock:](self->_impl, "setCompletionBlock:", a3);
}

- (id)completionBlock
{
  return (id)-[EKUIProposedTimeEventViewControllerImpl completionBlock](self->_impl, "completionBlock");
}

- (void)setRemoteUIDelegate:(id)a3
{
  -[EKUIProposedTimeEventViewControllerImpl setRemoteUIDelegate:](self->_impl, "setRemoteUIDelegate:", a3);
}

- (EKViewControllerRemoteUIDelegate)remoteUIDelegate
{
  return (EKViewControllerRemoteUIDelegate *)-[EKUIProposedTimeEventViewControllerImpl remoteUIDelegate](self->_impl, "remoteUIDelegate");
}

- (void)setNavigationDelegate:(id)a3
{
  -[EKUIProposedTimeEventViewControllerImpl setNavigationDelegate:](self->_impl, "setNavigationDelegate:", a3);
}

- (EKUIViewControllerNavigationDelegate)navigationDelegate
{
  return (EKUIViewControllerNavigationDelegate *)-[EKUIProposedTimeEventViewControllerImpl navigationDelegate](self->_impl, "navigationDelegate");
}

- (void)acceptButtonTapped
{
  -[EKUIProposedTimeEventViewControllerImpl acceptButtonTapped](self->_impl, "acceptButtonTapped");
}

- (void)replyButtonTapped
{
  -[EKUIProposedTimeEventViewControllerImpl replyButtonTapped](self->_impl, "replyButtonTapped");
}

- (void)rejectButtonTapped
{
  -[EKUIProposedTimeEventViewControllerImpl rejectButtonTapped](self->_impl, "rejectButtonTapped");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_impl, 0);
}

@end
