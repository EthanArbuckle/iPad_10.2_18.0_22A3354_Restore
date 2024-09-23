@implementation CUIKProposedTimeEventViewControllerManager

- (CUIKProposedTimeEventViewControllerManager)initWithDelegate:(id)a3 proposedTime:(id)a4
{
  id v6;
  id v7;
  CUIKProposedTimeEventViewControllerManager *v8;
  _TtC13CalendarUIKit46CUIKProposedTimeEventViewControllerManagerImpl *v9;
  _TtC13CalendarUIKit46CUIKProposedTimeEventViewControllerManagerImpl *impl;
  objc_super v12;

  v6 = a3;
  v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)CUIKProposedTimeEventViewControllerManager;
  v8 = -[CUIKProposedTimeEventViewControllerManager init](&v12, sel_init);
  if (v8)
  {
    v9 = -[CUIKProposedTimeEventViewControllerManagerImpl initWithDelegate:proposedTime:]([_TtC13CalendarUIKit46CUIKProposedTimeEventViewControllerManagerImpl alloc], "initWithDelegate:proposedTime:", v6, v7);
    impl = v8->_impl;
    v8->_impl = v9;

  }
  return v8;
}

- (UIViewController)viewController
{
  return -[CUIKProposedTimeEventViewControllerManagerImpl viewController](self->_impl, "viewController");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_impl, 0);
}

@end
