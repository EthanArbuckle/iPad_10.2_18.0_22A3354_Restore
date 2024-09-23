@implementation iOSFooterToolbarViewController

- (_TtC8Business30iOSFooterToolbarViewController)initWithCoder:(id)a3
{
  id v5;
  _TtC8Business30iOSFooterToolbarViewController *result;

  *(_QWORD *)&self->footerToolbarModel[OBJC_IVAR____TtC8Business30iOSFooterToolbarViewController_delegate] = 0;
  swift_unknownObjectWeakInit();
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC8Business30iOSFooterToolbarViewController____lazy_storage___leftButtonItem) = 0;
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC8Business30iOSFooterToolbarViewController____lazy_storage___rightButtonItem) = 0;
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC8Business30iOSFooterToolbarViewController____lazy_storage___buttonItems) = 0;
  v5 = a3;

  result = (_TtC8Business30iOSFooterToolbarViewController *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x80000001000B3DA0, "Business/iOSFooterToolbarViewController.swift", 45, 2, 38, 0);
  __break(1u);
  return result;
}

- (void)leftButtonTapped
{
  char *v3;
  uint64_t Strong;
  uint64_t v5;
  uint64_t v6;
  void (*v7)(void);
  _TtC8Business30iOSFooterToolbarViewController *v8;

  v3 = (char *)self + OBJC_IVAR____TtC8Business30iOSFooterToolbarViewController_delegate;
  Strong = swift_unknownObjectWeakLoadStrong((char *)self + OBJC_IVAR____TtC8Business30iOSFooterToolbarViewController_delegate);
  if (Strong)
  {
    v5 = Strong;
    v6 = *((_QWORD *)v3 + 1);
    swift_getObjectType();
    v7 = *(void (**)(void))(v6 + 8);
    v8 = self;
    v7();

    swift_unknownObjectRelease(v5);
  }
}

- (void)rightButtonTapped
{
  char *v3;
  uint64_t Strong;
  uint64_t v5;
  uint64_t v6;
  void (*v7)(void);
  _TtC8Business30iOSFooterToolbarViewController *v8;

  v3 = (char *)self + OBJC_IVAR____TtC8Business30iOSFooterToolbarViewController_delegate;
  Strong = swift_unknownObjectWeakLoadStrong((char *)self + OBJC_IVAR____TtC8Business30iOSFooterToolbarViewController_delegate);
  if (Strong)
  {
    v5 = Strong;
    v6 = *((_QWORD *)v3 + 1);
    swift_getObjectType();
    v7 = *(void (**)(void))(v6 + 16);
    v8 = self;
    v7();

    swift_unknownObjectRelease(v5);
  }
}

- (_TtC8Business30iOSFooterToolbarViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4;
  _TtC8Business30iOSFooterToolbarViewController *result;

  v4 = a4;
  result = (_TtC8Business30iOSFooterToolbarViewController *)_swift_stdlib_reportUnimplementedInitializer("Business.iOSFooterToolbarViewController", 39, "init(nibName:bundle:)", 21, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release(*(Class *)((char *)&self->super.super.super.isa
                         + OBJC_IVAR____TtC8Business30iOSFooterToolbarViewController_footerToolbarModel));
  sub_100011A64((uint64_t)self + OBJC_IVAR____TtC8Business30iOSFooterToolbarViewController_delegate);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8Business30iOSFooterToolbarViewController____lazy_storage___leftButtonItem));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8Business30iOSFooterToolbarViewController____lazy_storage___rightButtonItem));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.isa
                                     + OBJC_IVAR____TtC8Business30iOSFooterToolbarViewController____lazy_storage___buttonItems));
}

@end
