@implementation EKUIEventInviteesEditViewController

- (EKUIEventInviteesEditViewController)initWithEvent:(id)a3
{
  id v5;
  EKUIEventInviteesEditViewController *v6;
  EKUIEventInviteesEditViewController *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)EKUIEventInviteesEditViewController;
  v6 = -[EKUIEventInviteesEditViewController initWithNibName:bundle:](&v9, sel_initWithNibName_bundle_, 0, 0);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_event, a3);

  return v7;
}

- (void)loadView
{
  EKUIEventInviteesViewController *v3;
  void *v4;
  EKUIInviteesEditView *v5;
  EKUIInviteesEditView *v6;
  EKUIEventInviteesViewController *controller;
  id v8;

  v3 = -[EKUIEventInviteesViewController initWithEvent:fromDetail:model:]([EKUIEventInviteesViewController alloc], "initWithEvent:fromDetail:model:", self->_event, 0, 0);
  -[EKUIEventInviteesViewController setParentController:](v3, "setParentController:", self);
  -[EKUIEventInviteesViewController setUsesCustomToolbar:](v3, "setUsesCustomToolbar:", 1);
  if (-[EKEvent isNew](self->_event, "isNew"))
    -[EKUIEventInviteesViewController setUsesRaisedCustomToolbar:](v3, "setUsesRaisedCustomToolbar:", 1);
  -[EKUIEventInviteesViewController setHidesManagedAttendeesSection:](v3, "setHidesManagedAttendeesSection:", 1);
  -[EKUIEventInviteesViewController title](v3, "title");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKUIEventInviteesEditViewController setTitle:](self, "setTitle:", v4);

  -[EKUIEventInviteesEditViewController addChildViewController:](self, "addChildViewController:", v3);
  -[EKUIEventInviteesViewController view](v3, "view");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setAutoresizingMask:", 18);
  v5 = [EKUIInviteesEditView alloc];
  v6 = -[EKUIInviteesEditView initWithFrame:](v5, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  -[EKUIInviteesEditView setAutoresizingMask:](v6, "setAutoresizingMask:", 18);
  -[EKUIInviteesEditView addSubview:](v6, "addSubview:", v8);
  controller = self->_controller;
  self->_controller = v3;

  -[EKUIEventInviteesEditViewController setView:](self, "setView:", v6);
}

- (void)viewDidAppear:(BOOL)a3
{
  _BOOL8 v3;
  objc_super v5;

  v3 = a3;
  -[EKUIEventInviteesViewController didMoveToParentViewController:](self->_controller, "didMoveToParentViewController:", self);
  v5.receiver = self;
  v5.super_class = (Class)EKUIEventInviteesEditViewController;
  -[EKUIEventInviteesEditViewController viewDidAppear:](&v5, sel_viewDidAppear_, v3);
}

- (NSDate)selectedStartDate
{
  return -[EKUIEventInviteesViewController selectedStartDate](self->_controller, "selectedStartDate");
}

- (NSDate)selectedEndDate
{
  return -[EKUIEventInviteesViewController selectedEndDate](self->_controller, "selectedEndDate");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_controller, 0);
  objc_storeStrong((id *)&self->_event, 0);
}

@end
