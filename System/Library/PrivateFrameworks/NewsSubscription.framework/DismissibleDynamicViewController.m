@implementation DismissibleDynamicViewController

- (_TtC16NewsSubscription32DismissibleDynamicViewController)initWithCoder:(id)a3
{
  id v5;
  _TtC16NewsSubscription32DismissibleDynamicViewController *result;

  *(_QWORD *)((char *)&self->super.super.super._responderFlags
            + OBJC_IVAR____TtC16NewsSubscription32DismissibleDynamicViewController_dismissDelegate) = 0;
  swift_unknownObjectWeakInit();
  v5 = a3;

  result = (_TtC16NewsSubscription32DismissibleDynamicViewController *)sub_1BA438260();
  __break(1u);
  return result;
}

- (void)presentationControllerDidDismiss:(id)a3
{
  char *v5;
  uint64_t v6;
  void (*v7)(void);
  id v8;
  _TtC16NewsSubscription32DismissibleDynamicViewController *v9;

  v5 = (char *)self + OBJC_IVAR____TtC16NewsSubscription32DismissibleDynamicViewController_dismissDelegate;
  swift_beginAccess();
  if (MEMORY[0x1BCCDC4E4](v5))
  {
    v6 = *((_QWORD *)v5 + 1);
    swift_getObjectType();
    v7 = *(void (**)(void))(v6 + 8);
    v8 = a3;
    v9 = self;
    v7();

    swift_unknownObjectRelease();
  }
}

- (_TtC16NewsSubscription32DismissibleDynamicViewController)initWithNavigationBarClass:(Class)a3 toolbarClass:(Class)a4
{
  _TtC16NewsSubscription32DismissibleDynamicViewController *result;

  result = (_TtC16NewsSubscription32DismissibleDynamicViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (_TtC16NewsSubscription32DismissibleDynamicViewController)initWithRootViewController:(id)a3
{
  id v3;
  _TtC16NewsSubscription32DismissibleDynamicViewController *result;

  v3 = a3;
  result = (_TtC16NewsSubscription32DismissibleDynamicViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (_TtC16NewsSubscription32DismissibleDynamicViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4;
  _TtC16NewsSubscription32DismissibleDynamicViewController *result;

  v4 = a4;
  result = (_TtC16NewsSubscription32DismissibleDynamicViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  sub_1BA3110FC((uint64_t)self + OBJC_IVAR____TtC16NewsSubscription32DismissibleDynamicViewController_dismissDelegate);
}

@end
