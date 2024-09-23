@implementation CUIKCreateFamilyCalendarFlowControllerManagerImpl

- (_TtC13CalendarUIKit49CUIKCreateFamilyCalendarFlowControllerManagerImpl)initWithDelegate:(id)a3
{
  objc_super v5;

  swift_unknownObjectWeakInit();
  *(Class *)((char *)&self->super.isa
           + OBJC_IVAR____TtC13CalendarUIKit49CUIKCreateFamilyCalendarFlowControllerManagerImpl____lazy_storage___viewController) = 0;
  swift_unknownObjectWeakAssign();
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for CUIKCreateFamilyCalendarFlowControllerManagerImpl();
  return -[CUIKCreateFamilyCalendarFlowControllerManagerImpl init](&v5, sel_init);
}

- (UIViewController)viewController
{
  _TtC13CalendarUIKit49CUIKCreateFamilyCalendarFlowControllerManagerImpl *v2;
  id v3;

  v2 = self;
  v3 = sub_1B8B4D270();

  return (UIViewController *)v3;
}

- (void)setViewController:(id)a3
{
  id v3;
  id v4;

  v4 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR____TtC13CalendarUIKit49CUIKCreateFamilyCalendarFlowControllerManagerImpl____lazy_storage___viewController);
  *(Class *)((char *)&self->super.isa
           + OBJC_IVAR____TtC13CalendarUIKit49CUIKCreateFamilyCalendarFlowControllerManagerImpl____lazy_storage___viewController) = (Class)a3;
  v3 = a3;

}

- (_TtC13CalendarUIKit49CUIKCreateFamilyCalendarFlowControllerManagerImpl)init
{
  _TtC13CalendarUIKit49CUIKCreateFamilyCalendarFlowControllerManagerImpl *result;

  result = (_TtC13CalendarUIKit49CUIKCreateFamilyCalendarFlowControllerManagerImpl *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_1B8B0B598((uint64_t)self + OBJC_IVAR____TtC13CalendarUIKit49CUIKCreateFamilyCalendarFlowControllerManagerImpl_delegate);
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC13CalendarUIKit49CUIKCreateFamilyCalendarFlowControllerManagerImpl____lazy_storage___viewController));
}

@end
