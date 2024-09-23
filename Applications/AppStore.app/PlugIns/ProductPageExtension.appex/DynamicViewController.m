@implementation DynamicViewController

- (_TtC20ProductPageExtension21DynamicViewController)initWithCoder:(id)a3
{
  unsigned __int8 *v4;
  id v5;
  _TtC20ProductPageExtension21DynamicViewController *result;

  *(_QWORD *)&self->AMSUIDynamicViewController_opaque[OBJC_IVAR____TtC20ProductPageExtension21DynamicViewController_dynamicDelegate] = 0;
  *(_QWORD *)&self->AMSUIDynamicViewController_opaque[OBJC_IVAR____TtC20ProductPageExtension21DynamicViewController_gridPresenter] = 0;
  v4 = &self->AMSUIDynamicViewController_opaque[OBJC_IVAR____TtC20ProductPageExtension21DynamicViewController_gridView];
  *(_QWORD *)v4 = 0;
  *((_QWORD *)v4 + 1) = 0;
  v5 = a3;

  result = (_TtC20ProductPageExtension21DynamicViewController *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x8000000100685560, "ProductPageExtension/DynamicViewController.swift", 48, 2, 58, 0);
  __break(1u);
  return result;
}

- (void)viewDidLoad
{
  objc_class *ObjectType;
  _TtC20ProductPageExtension21DynamicViewController *v4;
  objc_super v5;

  ObjectType = (objc_class *)swift_getObjectType();
  sub_10006B2B4(&qword_10080AC58, (uint64_t)&unk_1006433F0);
  v4 = self;
  DynamicViewControllerDisplaying.injectFieldsIntoMetricsOverlay()();
  v5.receiver = v4;
  v5.super_class = ObjectType;
  -[DynamicViewController viewDidLoad](&v5, "viewDidLoad");

}

- (_TtC20ProductPageExtension21DynamicViewController)initWithBag:(id)a3 bagValue:(id)a4
{
  sub_10006ADAC((uint64_t)self, (uint64_t)a2, (uint64_t)a3, a4, (uint64_t)"init(bag:bagValue:)", 19);
}

- (_TtC20ProductPageExtension21DynamicViewController)initWithBag:(id)a3 URL:(id)a4
{
  sub_10006AE04((uint64_t)self, (uint64_t)a2, (uint64_t)a3, (uint64_t)a4, (uint64_t)"init(bag:url:)", 14);
}

- (_TtC20ProductPageExtension21DynamicViewController)initWithBag:(id)a3 javaScriptBagValue:(id)a4
{
  sub_10006ADAC((uint64_t)self, (uint64_t)a2, (uint64_t)a3, a4, (uint64_t)"init(bag:javaScriptBagValue:)", 29);
}

- (_TtC20ProductPageExtension21DynamicViewController)initWithBag:(id)a3 javaScriptURL:(id)a4
{
  sub_10006AE04((uint64_t)self, (uint64_t)a2, (uint64_t)a3, (uint64_t)a4, (uint64_t)"init(bag:javaScriptURL:)", 24);
}

- (_TtC20ProductPageExtension21DynamicViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4;
  _TtC20ProductPageExtension21DynamicViewController *result;

  v4 = a4;
  result = (_TtC20ProductPageExtension21DynamicViewController *)_swift_stdlib_reportUnimplementedInitializer("ProductPageExtension.DynamicViewController", 42, "init(nibName:bundle:)", 21, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release(*(_QWORD *)&self->AMSUIDynamicViewController_opaque[OBJC_IVAR____TtC20ProductPageExtension21DynamicViewController_objectGraph]);
  swift_release(*(_QWORD *)&self->AMSUIDynamicViewController_opaque[OBJC_IVAR____TtC20ProductPageExtension21DynamicViewController_artworkLoader]);
  swift_bridgeObjectRelease(*(_QWORD *)&self->objectGraph[OBJC_IVAR____TtC20ProductPageExtension21DynamicViewController_referrer]);
  swift_unknownObjectRelease(*(_QWORD *)&self->AMSUIDynamicViewController_opaque[OBJC_IVAR____TtC20ProductPageExtension21DynamicViewController_dynamicDelegate]);
  swift_release(*(_QWORD *)&self->AMSUIDynamicViewController_opaque[OBJC_IVAR____TtC20ProductPageExtension21DynamicViewController_requestInfo]);
  swift_release(*(_QWORD *)&self->AMSUIDynamicViewController_opaque[OBJC_IVAR____TtC20ProductPageExtension21DynamicViewController_gridPresenter]);

}

@end
