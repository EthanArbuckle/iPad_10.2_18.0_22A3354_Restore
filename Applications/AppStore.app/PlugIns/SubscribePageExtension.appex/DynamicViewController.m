@implementation DynamicViewController

- (_TtC22SubscribePageExtension21DynamicViewController)initWithCoder:(id)a3
{
  unsigned __int8 *v4;
  id v5;
  _TtC22SubscribePageExtension21DynamicViewController *result;

  *(_QWORD *)&self->AMSUIDynamicViewController_opaque[OBJC_IVAR____TtC22SubscribePageExtension21DynamicViewController_dynamicDelegate] = 0;
  *(_QWORD *)&self->AMSUIDynamicViewController_opaque[OBJC_IVAR____TtC22SubscribePageExtension21DynamicViewController_gridPresenter] = 0;
  v4 = &self->AMSUIDynamicViewController_opaque[OBJC_IVAR____TtC22SubscribePageExtension21DynamicViewController_gridView];
  *(_QWORD *)v4 = 0;
  *((_QWORD *)v4 + 1) = 0;
  v5 = a3;

  result = (_TtC22SubscribePageExtension21DynamicViewController *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x800000010062E5C0, "SubscribePageExtension/DynamicViewController.swift", 50, 2, 58, 0);
  __break(1u);
  return result;
}

- (void)viewDidLoad
{
  objc_class *ObjectType;
  uint64_t v4;
  _TtC22SubscribePageExtension21DynamicViewController *v5;
  objc_super v6;

  ObjectType = (objc_class *)swift_getObjectType();
  sub_10001F65C((unint64_t *)&unk_100800120, v4, (uint64_t (*)(uint64_t))type metadata accessor for DynamicViewController, (uint64_t)&unk_10067AB30);
  v5 = self;
  DynamicViewControllerDisplaying.injectFieldsIntoMetricsOverlay()();
  v6.receiver = v5;
  v6.super_class = ObjectType;
  -[DynamicViewController viewDidLoad](&v6, "viewDidLoad");

}

- (_TtC22SubscribePageExtension21DynamicViewController)initWithBag:(id)a3 bagValue:(id)a4
{
  sub_1001BDBA8((uint64_t)self, (uint64_t)a2, (uint64_t)a3, a4, (uint64_t)"init(bag:bagValue:)", 19);
}

- (_TtC22SubscribePageExtension21DynamicViewController)initWithBag:(id)a3 URL:(id)a4
{
  sub_1001BDC00((uint64_t)self, (uint64_t)a2, (uint64_t)a3, (uint64_t)a4, (uint64_t)"init(bag:url:)", 14);
}

- (_TtC22SubscribePageExtension21DynamicViewController)initWithBag:(id)a3 javaScriptBagValue:(id)a4
{
  sub_1001BDBA8((uint64_t)self, (uint64_t)a2, (uint64_t)a3, a4, (uint64_t)"init(bag:javaScriptBagValue:)", 29);
}

- (_TtC22SubscribePageExtension21DynamicViewController)initWithBag:(id)a3 javaScriptURL:(id)a4
{
  sub_1001BDC00((uint64_t)self, (uint64_t)a2, (uint64_t)a3, (uint64_t)a4, (uint64_t)"init(bag:javaScriptURL:)", 24);
}

- (_TtC22SubscribePageExtension21DynamicViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4;
  _TtC22SubscribePageExtension21DynamicViewController *result;

  v4 = a4;
  result = (_TtC22SubscribePageExtension21DynamicViewController *)_swift_stdlib_reportUnimplementedInitializer("SubscribePageExtension.DynamicViewController", 44, "init(nibName:bundle:)", 21, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release(*(_QWORD *)&self->AMSUIDynamicViewController_opaque[OBJC_IVAR____TtC22SubscribePageExtension21DynamicViewController_objectGraph]);
  swift_release(*(_QWORD *)&self->AMSUIDynamicViewController_opaque[OBJC_IVAR____TtC22SubscribePageExtension21DynamicViewController_artworkLoader]);
  swift_bridgeObjectRelease(*(_QWORD *)&self->objectGraph[OBJC_IVAR____TtC22SubscribePageExtension21DynamicViewController_referrer]);
  swift_unknownObjectRelease(*(_QWORD *)&self->AMSUIDynamicViewController_opaque[OBJC_IVAR____TtC22SubscribePageExtension21DynamicViewController_dynamicDelegate]);
  swift_release(*(_QWORD *)&self->AMSUIDynamicViewController_opaque[OBJC_IVAR____TtC22SubscribePageExtension21DynamicViewController_requestInfo]);
  swift_release(*(_QWORD *)&self->AMSUIDynamicViewController_opaque[OBJC_IVAR____TtC22SubscribePageExtension21DynamicViewController_gridPresenter]);

}

@end
