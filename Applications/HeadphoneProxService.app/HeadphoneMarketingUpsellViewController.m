@implementation HeadphoneMarketingUpsellViewController

- (void)viewDidLoad
{
  id v2;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for HeadphoneMarketingUpsellViewController();
  v2 = v3.receiver;
  -[HeadphoneMarketingUpsellViewController viewDidLoad](&v3, "viewDidLoad");
  sub_1000226DC();
  objc_msgSend(v2, "setDismissalType:", 1, v3.receiver, v3.super_class);

}

- (_TtC20HeadphoneProxService38HeadphoneMarketingUpsellViewController)initWithContentView:(id)a3
{
  id v3;
  __n128 v4;
  __n128 v5;
  __n128 v6;
  __n128 v7;
  _TtC20HeadphoneProxService38HeadphoneMarketingUpsellViewController *result;

  v3 = a3;
  result = (_TtC20HeadphoneProxService38HeadphoneMarketingUpsellViewController *)_swift_stdlib_reportUnimplementedInitializer("HeadphoneProxService.HeadphoneMarketingUpsellViewController", 59, "init(contentView:)", 18, 0, v4, v5, v6, v7);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{

  sub_100009FD0((uint64_t)&self->PRXCardContentViewController_opaque[OBJC_IVAR____TtC20HeadphoneProxService38HeadphoneMarketingUpsellViewController_presenter]);
}

- (void)dynamicViewController:(id)a3 didResolveWithResult:(id)a4 error:(id)a5
{
  uint64_t v8;
  id v9;
  id v10;
  _TtC20HeadphoneProxService38HeadphoneMarketingUpsellViewController *v11;

  if (a4)
    v8 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)(a4, &type metadata for AnyHashable, (char *)&type metadata for Any + 8, &protocol witness table for AnyHashable);
  else
    v8 = 0;
  v9 = a3;
  v10 = a5;
  v11 = self;
  sub_100022CC4(v9, v8, (uint64_t)a5);

  swift_bridgeObjectRelease(v8);
}

@end
