@implementation DynamicViewController

- (_TtC8AppStore21DynamicViewController)initWithCoder:(id)a3
{
  unsigned __int8 *v4;
  id v5;
  _TtC8AppStore21DynamicViewController *result;

  *(_QWORD *)&self->AMSUIDynamicViewController_opaque[OBJC_IVAR____TtC8AppStore21DynamicViewController_dynamicDelegate] = 0;
  *(_QWORD *)&self->AMSUIDynamicViewController_opaque[OBJC_IVAR____TtC8AppStore21DynamicViewController_gridPresenter] = 0;
  v4 = &self->AMSUIDynamicViewController_opaque[OBJC_IVAR____TtC8AppStore21DynamicViewController_gridView];
  *(_QWORD *)v4 = 0;
  *((_QWORD *)v4 + 1) = 0;
  v5 = a3;

  result = (_TtC8AppStore21DynamicViewController *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x80000001006A63C0, "AppStore/DynamicViewController.swift", 36, 2, 58, 0);
  __break(1u);
  return result;
}

- (void)viewDidLoad
{
  objc_class *ObjectType;
  _TtC8AppStore21DynamicViewController *v4;
  objc_super v5;

  ObjectType = (objc_class *)swift_getObjectType();
  sub_1005560C0(&qword_10084D748, (uint64_t)&unk_100687CD0);
  v4 = self;
  DynamicViewControllerDisplaying.injectFieldsIntoMetricsOverlay()();
  v5.receiver = v4;
  v5.super_class = ObjectType;
  -[DynamicViewController viewDidLoad](&v5, "viewDidLoad");

}

- (_TtC8AppStore21DynamicViewController)initWithBag:(id)a3 bagValue:(id)a4
{
  sub_100555BB8((uint64_t)self, (uint64_t)a2, (uint64_t)a3, a4, (uint64_t)"init(bag:bagValue:)", 19);
}

- (_TtC8AppStore21DynamicViewController)initWithBag:(id)a3 URL:(id)a4
{
  sub_100555C10((uint64_t)self, (uint64_t)a2, (uint64_t)a3, (uint64_t)a4, (uint64_t)"init(bag:url:)", 14);
}

- (_TtC8AppStore21DynamicViewController)initWithBag:(id)a3 javaScriptBagValue:(id)a4
{
  sub_100555BB8((uint64_t)self, (uint64_t)a2, (uint64_t)a3, a4, (uint64_t)"init(bag:javaScriptBagValue:)", 29);
}

- (_TtC8AppStore21DynamicViewController)initWithBag:(id)a3 javaScriptURL:(id)a4
{
  sub_100555C10((uint64_t)self, (uint64_t)a2, (uint64_t)a3, (uint64_t)a4, (uint64_t)"init(bag:javaScriptURL:)", 24);
}

- (_TtC8AppStore21DynamicViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4;
  _TtC8AppStore21DynamicViewController *result;

  v4 = a4;
  result = (_TtC8AppStore21DynamicViewController *)_swift_stdlib_reportUnimplementedInitializer("AppStore.DynamicViewController", 30, "init(nibName:bundle:)", 21, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release(*(_QWORD *)&self->AMSUIDynamicViewController_opaque[OBJC_IVAR____TtC8AppStore21DynamicViewController_objectGraph]);
  swift_release(*(_QWORD *)&self->AMSUIDynamicViewController_opaque[OBJC_IVAR____TtC8AppStore21DynamicViewController_artworkLoader]);
  swift_bridgeObjectRelease(*(_QWORD *)&self->objectGraph[OBJC_IVAR____TtC8AppStore21DynamicViewController_referrer]);
  swift_unknownObjectRelease(*(_QWORD *)&self->AMSUIDynamicViewController_opaque[OBJC_IVAR____TtC8AppStore21DynamicViewController_dynamicDelegate]);
  swift_release(*(_QWORD *)&self->AMSUIDynamicViewController_opaque[OBJC_IVAR____TtC8AppStore21DynamicViewController_requestInfo]);
  swift_release(*(_QWORD *)&self->AMSUIDynamicViewController_opaque[OBJC_IVAR____TtC8AppStore21DynamicViewController_gridPresenter]);

}

@end
