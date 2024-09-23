@implementation MarketingItemViewController

- (_TtC8AppStore27MarketingItemViewController)initWithCoder:(id)a3
{
  unsigned __int8 *v4;
  id v5;
  _TtC8AppStore27MarketingItemViewController *result;

  *(_QWORD *)&self->AMSUIMarketingItemViewController_opaque[OBJC_IVAR____TtC8AppStore27MarketingItemViewController_dynamicDelegate] = 0;
  *(_QWORD *)&self->AMSUIMarketingItemViewController_opaque[OBJC_IVAR____TtC8AppStore27MarketingItemViewController_gridPresenter] = 0;
  v4 = &self->AMSUIMarketingItemViewController_opaque[OBJC_IVAR____TtC8AppStore27MarketingItemViewController_gridView];
  *(_QWORD *)v4 = 0;
  *((_QWORD *)v4 + 1) = 0;
  v5 = a3;

  result = (_TtC8AppStore27MarketingItemViewController *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x80000001006A63C0, "AppStore/MarketingItemViewController.swift", 42, 2, 63, 0);
  __break(1u);
  return result;
}

- (void)viewDidLoad
{
  objc_class *ObjectType;
  uint64_t v4;
  _TtC8AppStore27MarketingItemViewController *v5;
  objc_super v6;

  ObjectType = (objc_class *)swift_getObjectType();
  sub_100057438((unint64_t *)&unk_100849010, v4, (uint64_t (*)(uint64_t))type metadata accessor for MarketingItemViewController, (uint64_t)&unk_100683168);
  v5 = self;
  DynamicViewControllerDisplaying.injectFieldsIntoMetricsOverlay()();
  v6.receiver = v5;
  v6.super_class = ObjectType;
  -[MarketingItemViewController viewDidLoad](&v6, "viewDidLoad");

}

- (_TtC8AppStore27MarketingItemViewController)initWithMarketingItem:(id)a3 bag:(id)a4
{
  id v5;
  _TtC8AppStore27MarketingItemViewController *result;

  v5 = a3;
  swift_unknownObjectRetain(a4);
  result = (_TtC8AppStore27MarketingItemViewController *)_swift_stdlib_reportUnimplementedInitializer("AppStore.MarketingItemViewController", 36, "init(marketingItem:bag:)", 24, 0);
  __break(1u);
  return result;
}

- (_TtC8AppStore27MarketingItemViewController)initWithServiceType:(id)a3 placement:(id)a4 bag:(id)a5
{
  _TtC8AppStore27MarketingItemViewController *result;

  swift_unknownObjectRetain(a5);
  result = (_TtC8AppStore27MarketingItemViewController *)_swift_stdlib_reportUnimplementedInitializer("AppStore.MarketingItemViewController", 36, "init(serviceType:placement:bag:)", 32, 0);
  __break(1u);
  return result;
}

- (_TtC8AppStore27MarketingItemViewController)initWithServiceType:(id)a3 placement:(id)a4 account:(id)a5 bag:(id)a6
{
  id v7;
  _TtC8AppStore27MarketingItemViewController *result;

  v7 = a5;
  swift_unknownObjectRetain(a6);
  result = (_TtC8AppStore27MarketingItemViewController *)_swift_stdlib_reportUnimplementedInitializer("AppStore.MarketingItemViewController", 36, "init(serviceType:placement:account:bag:)", 40, 0);
  __break(1u);
  return result;
}

- (_TtC8AppStore27MarketingItemViewController)initWithBag:(id)a3 bagValue:(id)a4
{
  id v5;
  _TtC8AppStore27MarketingItemViewController *result;

  swift_unknownObjectRetain(a3);
  v5 = a4;
  result = (_TtC8AppStore27MarketingItemViewController *)_swift_stdlib_reportUnimplementedInitializer("AppStore.MarketingItemViewController", 36, "init(bag:bagValue:)", 19, 0);
  __break(1u);
  return result;
}

- (_TtC8AppStore27MarketingItemViewController)initWithBag:(id)a3 URL:(id)a4
{
  uint64_t v6;
  _TtC8AppStore27MarketingItemViewController *result;

  v6 = type metadata accessor for URL(0);
  __chkstk_darwin(v6);
  static URL._unconditionallyBridgeFromObjectiveC(_:)(a4);
  swift_unknownObjectRetain(a3);
  result = (_TtC8AppStore27MarketingItemViewController *)_swift_stdlib_reportUnimplementedInitializer("AppStore.MarketingItemViewController", 36, "init(bag:url:)", 14, 0);
  __break(1u);
  return result;
}

- (_TtC8AppStore27MarketingItemViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4;
  _TtC8AppStore27MarketingItemViewController *result;

  v4 = a4;
  result = (_TtC8AppStore27MarketingItemViewController *)_swift_stdlib_reportUnimplementedInitializer("AppStore.MarketingItemViewController", 36, "init(nibName:bundle:)", 21, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release(*(_QWORD *)&self->AMSUIMarketingItemViewController_opaque[OBJC_IVAR____TtC8AppStore27MarketingItemViewController_objectGraph]);
  swift_release(*(_QWORD *)&self->AMSUIMarketingItemViewController_opaque[OBJC_IVAR____TtC8AppStore27MarketingItemViewController_artworkLoader]);
  swift_bridgeObjectRelease(*(_QWORD *)&self->objectGraph[OBJC_IVAR____TtC8AppStore27MarketingItemViewController_referrer]);
  swift_unknownObjectRelease(*(_QWORD *)&self->AMSUIMarketingItemViewController_opaque[OBJC_IVAR____TtC8AppStore27MarketingItemViewController_dynamicDelegate]);
  swift_release(*(_QWORD *)&self->AMSUIMarketingItemViewController_opaque[OBJC_IVAR____TtC8AppStore27MarketingItemViewController_requestInfo]);
  swift_release(*(_QWORD *)&self->AMSUIMarketingItemViewController_opaque[OBJC_IVAR____TtC8AppStore27MarketingItemViewController_gridPresenter]);

}

@end
