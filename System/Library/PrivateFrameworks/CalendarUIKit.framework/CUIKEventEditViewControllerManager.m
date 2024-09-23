@implementation CUIKEventEditViewControllerManager

- (CUIKEventEditViewControllerManager)initWithDelegate:(id)a3
{
  id v4;
  CUIKEventEditViewControllerManager *v5;
  _TtC13CalendarUIKit34CUIKEventViewControllerManagerImpl *v6;
  _TtC13CalendarUIKit34CUIKEventViewControllerManagerImpl *impl;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CUIKEventEditViewControllerManager;
  v5 = -[CUIKEventEditViewControllerManager init](&v9, sel_init);
  if (v5)
  {
    v6 = -[CUIKEventViewControllerManagerImpl initWithEditViewControllerDelegate:]([_TtC13CalendarUIKit34CUIKEventViewControllerManagerImpl alloc], "initWithEditViewControllerDelegate:", v4);
    impl = v5->_impl;
    v5->_impl = v6;

  }
  return v5;
}

- (UIViewController)viewController
{
  return -[CUIKEventViewControllerManagerImpl viewController](self->_impl, "viewController");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_impl, 0);
}

@end
