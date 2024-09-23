@implementation FMRemoteUIHawkeyeUpsellContentViewController

- (_TtC21FindMyRemoteUIService44FMRemoteUIHawkeyeUpsellContentViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  uint64_t v6;
  uint64_t v7;
  id v8;
  NSString v9;
  id v10;
  _TtC21FindMyRemoteUIService44FMRemoteUIHawkeyeUpsellContentViewController *v11;
  objc_super v13;

  if (a3)
  {
    static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
    v7 = v6;
    v8 = a4;
    v9 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(v7);
  }
  else
  {
    v10 = a4;
    v9 = 0;
  }
  v13.receiver = self;
  v13.super_class = (Class)type metadata accessor for FMRemoteUIHawkeyeUpsellContentViewController();
  v11 = -[FMRemoteUIPRXFlowContentViewController initWithNibName:bundle:](&v13, "initWithNibName:bundle:", v9, a4);

  return v11;
}

- (_TtC21FindMyRemoteUIService44FMRemoteUIHawkeyeUpsellContentViewController)initWithCoder:(id)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for FMRemoteUIHawkeyeUpsellContentViewController();
  return -[FMRemoteUIPRXFlowContentViewController initWithCoder:](&v5, "initWithCoder:", a3);
}

@end
