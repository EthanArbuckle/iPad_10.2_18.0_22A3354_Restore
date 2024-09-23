@implementation SelectCategoryViewController

- (_TtC8AppStore28SelectCategoryViewController)initWithCoder:(id)a3
{
  _QWORD *v4;
  id v5;
  _TtC8AppStore28SelectCategoryViewController *result;

  v4 = (Class *)((char *)&self->super.super.super.super.isa
               + OBJC_IVAR____TtC8AppStore28SelectCategoryViewController_selectionHandler);
  *v4 = 0;
  v4[1] = 0;
  v5 = a3;

  result = (_TtC8AppStore28SelectCategoryViewController *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x80000001006A63C0, "AppStore/SelectCategoryViewController.swift", 43, 2, 103, 0);
  __break(1u);
  return result;
}

- (_TtC8AppStore28SelectCategoryViewController)initWithNavigationBarClass:(Class)a3 toolbarClass:(Class)a4
{
  _TtC8AppStore28SelectCategoryViewController *result;

  result = (_TtC8AppStore28SelectCategoryViewController *)_swift_stdlib_reportUnimplementedInitializer("AppStore.SelectCategoryViewController", 37, "init(navigationBarClass:toolbarClass:)", 38, 0);
  __break(1u);
  return result;
}

- (_TtC8AppStore28SelectCategoryViewController)initWithRootViewController:(id)a3
{
  id v3;
  _TtC8AppStore28SelectCategoryViewController *result;

  v3 = a3;
  result = (_TtC8AppStore28SelectCategoryViewController *)_swift_stdlib_reportUnimplementedInitializer("AppStore.SelectCategoryViewController", 37, "init(rootViewController:)", 25, 0);
  __break(1u);
  return result;
}

- (_TtC8AppStore28SelectCategoryViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  sub_100516274((uint64_t)self, (uint64_t)a2, (uint64_t)a3, a4, (uint64_t)"AppStore.SelectCategoryViewController", 37);
}

- (void).cxx_destruct
{
  sub_10003A350(*(uint64_t *)((char *)&self->super.super.super.super.isa+ OBJC_IVAR____TtC8AppStore28SelectCategoryViewController_selectionHandler), *(_QWORD *)&self->selectionHandler[OBJC_IVAR____TtC8AppStore28SelectCategoryViewController_selectionHandler]);
}

@end
