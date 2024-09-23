@implementation CUIKCreateFamilyCalendarFlowControllerManager

- (CUIKCreateFamilyCalendarFlowControllerManager)initWithDelegate:(id)a3
{
  id v4;
  CUIKCreateFamilyCalendarFlowControllerManager *v5;
  _TtC13CalendarUIKit49CUIKCreateFamilyCalendarFlowControllerManagerImpl *v6;
  _TtC13CalendarUIKit49CUIKCreateFamilyCalendarFlowControllerManagerImpl *impl;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CUIKCreateFamilyCalendarFlowControllerManager;
  v5 = -[CUIKCreateFamilyCalendarFlowControllerManager init](&v9, sel_init);
  if (v5)
  {
    v6 = -[CUIKCreateFamilyCalendarFlowControllerManagerImpl initWithDelegate:]([_TtC13CalendarUIKit49CUIKCreateFamilyCalendarFlowControllerManagerImpl alloc], "initWithDelegate:", v4);
    impl = v5->_impl;
    v5->_impl = v6;

  }
  return v5;
}

- (id)viewController
{
  return -[CUIKCreateFamilyCalendarFlowControllerManagerImpl viewController](self->_impl, "viewController");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_impl, 0);
}

@end
