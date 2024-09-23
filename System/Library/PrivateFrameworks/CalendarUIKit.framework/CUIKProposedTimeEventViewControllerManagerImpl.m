@implementation CUIKProposedTimeEventViewControllerManagerImpl

- (_TtC13CalendarUIKit46CUIKProposedTimeEventViewControllerManagerImpl)initWithDelegate:(id)a3 proposedTime:(id)a4
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  objc_class *v9;
  _TtC13CalendarUIKit46CUIKProposedTimeEventViewControllerManagerImpl *v10;
  objc_super v12;

  v5 = sub_1B8B9B0F0();
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x1E0C80A78](v5);
  v8 = (char *)&v12 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1B8B9B0D8();
  swift_unknownObjectWeakInit();
  *(Class *)((char *)&self->super.isa
           + OBJC_IVAR____TtC13CalendarUIKit46CUIKProposedTimeEventViewControllerManagerImpl_subscribers) = (Class)MEMORY[0x1E0DEE9E8];
  *(Class *)((char *)&self->super.isa
           + OBJC_IVAR____TtC13CalendarUIKit46CUIKProposedTimeEventViewControllerManagerImpl____lazy_storage___viewController) = 0;
  swift_unknownObjectWeakAssign();
  (*(void (**)(char *, char *, uint64_t))(v6 + 16))((char *)self + OBJC_IVAR____TtC13CalendarUIKit46CUIKProposedTimeEventViewControllerManagerImpl_proposedTime, v8, v5);
  v9 = (objc_class *)type metadata accessor for CUIKProposedTimeEventViewControllerManagerImpl();
  v12.receiver = self;
  v12.super_class = v9;
  v10 = -[CUIKProposedTimeEventViewControllerManagerImpl init](&v12, sel_init);
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  return v10;
}

- (UIViewController)viewController
{
  _TtC13CalendarUIKit46CUIKProposedTimeEventViewControllerManagerImpl *v2;
  id v3;

  v2 = self;
  v3 = sub_1B8B1B590();

  return (UIViewController *)v3;
}

- (void)setViewController:(id)a3
{
  id v3;
  id v4;

  v4 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR____TtC13CalendarUIKit46CUIKProposedTimeEventViewControllerManagerImpl____lazy_storage___viewController);
  *(Class *)((char *)&self->super.isa
           + OBJC_IVAR____TtC13CalendarUIKit46CUIKProposedTimeEventViewControllerManagerImpl____lazy_storage___viewController) = (Class)a3;
  v3 = a3;

}

- (_TtC13CalendarUIKit46CUIKProposedTimeEventViewControllerManagerImpl)init
{
  _TtC13CalendarUIKit46CUIKProposedTimeEventViewControllerManagerImpl *result;

  result = (_TtC13CalendarUIKit46CUIKProposedTimeEventViewControllerManagerImpl *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  sub_1B8B0B598((uint64_t)self + OBJC_IVAR____TtC13CalendarUIKit46CUIKProposedTimeEventViewControllerManagerImpl_delegate);
  v3 = (char *)self + OBJC_IVAR____TtC13CalendarUIKit46CUIKProposedTimeEventViewControllerManagerImpl_proposedTime;
  v4 = sub_1B8B9B0F0();
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC13CalendarUIKit46CUIKProposedTimeEventViewControllerManagerImpl____lazy_storage___viewController));
}

@end
