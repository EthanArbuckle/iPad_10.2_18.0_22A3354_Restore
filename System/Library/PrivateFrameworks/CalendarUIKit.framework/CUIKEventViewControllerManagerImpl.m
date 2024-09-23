@implementation CUIKEventViewControllerManagerImpl

- (_TtC13CalendarUIKit34CUIKEventViewControllerManagerImpl)initWithViewControllerDelegate:(id)a3
{
  objc_super v5;

  swift_unknownObjectWeakInit();
  swift_unknownObjectWeakInit();
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC13CalendarUIKit34CUIKEventViewControllerManagerImpl_subscribers) = (Class)MEMORY[0x1E0DEE9E8];
  *(Class *)((char *)&self->super.isa
           + OBJC_IVAR____TtC13CalendarUIKit34CUIKEventViewControllerManagerImpl____lazy_storage___viewController) = 0;
  swift_unknownObjectWeakAssign();
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for CUIKEventViewControllerManagerImpl();
  return -[CUIKEventViewControllerManagerImpl init](&v5, sel_init);
}

- (_TtC13CalendarUIKit34CUIKEventViewControllerManagerImpl)initWithEditViewControllerDelegate:(id)a3
{
  objc_super v5;

  swift_unknownObjectWeakInit();
  swift_unknownObjectWeakInit();
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC13CalendarUIKit34CUIKEventViewControllerManagerImpl_subscribers) = (Class)MEMORY[0x1E0DEE9E8];
  *(Class *)((char *)&self->super.isa
           + OBJC_IVAR____TtC13CalendarUIKit34CUIKEventViewControllerManagerImpl____lazy_storage___viewController) = 0;
  swift_unknownObjectWeakAssign();
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for CUIKEventViewControllerManagerImpl();
  return -[CUIKEventViewControllerManagerImpl init](&v5, sel_init);
}

- (UIViewController)viewController
{
  _TtC13CalendarUIKit34CUIKEventViewControllerManagerImpl *v2;
  id v3;

  v2 = self;
  v3 = sub_1B8B0AEC4();

  return (UIViewController *)v3;
}

- (void)setViewController:(id)a3
{
  id v3;
  id v4;

  v4 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR____TtC13CalendarUIKit34CUIKEventViewControllerManagerImpl____lazy_storage___viewController);
  *(Class *)((char *)&self->super.isa
           + OBJC_IVAR____TtC13CalendarUIKit34CUIKEventViewControllerManagerImpl____lazy_storage___viewController) = (Class)a3;
  v3 = a3;

}

- (_TtC13CalendarUIKit34CUIKEventViewControllerManagerImpl)init
{
  _TtC13CalendarUIKit34CUIKEventViewControllerManagerImpl *result;

  result = (_TtC13CalendarUIKit34CUIKEventViewControllerManagerImpl *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_1B8B0B598((uint64_t)self + OBJC_IVAR____TtC13CalendarUIKit34CUIKEventViewControllerManagerImpl_viewControllerDelegate);
  sub_1B8B0B598((uint64_t)self + OBJC_IVAR____TtC13CalendarUIKit34CUIKEventViewControllerManagerImpl_editViewControllerDelegate);
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC13CalendarUIKit34CUIKEventViewControllerManagerImpl____lazy_storage___viewController));
}

@end
