@implementation ApplicationInfoProvider

- (id)applicationInfoForBundleIdentifier:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _TtC12PreviewShell23ApplicationInfoProvider *v7;
  id v8;

  v4 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v6 = v5;
  v7 = self;
  v8 = sub_100014A84(v4, v6);

  swift_bridgeObjectRelease(v6);
  return v8;
}

- (id)applicationInfoForAuditToken:(id)a3
{
  id v4;
  _TtC12PreviewShell23ApplicationInfoProvider *v5;
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v4 = a3;
  v5 = self;
  v6 = objc_msgSend(v4, "bundleID");
  v7 = v6;
  if (v6)
  {
    v8 = static String._unconditionallyBridgeFromObjectiveC(_:)(v6);
    v10 = v9;

    v7 = sub_100014A84(v8, v10);
    swift_bridgeObjectRelease(v10);
  }
  else
  {

  }
  return v7;
}

- (_TtC12PreviewShell23ApplicationInfoProvider)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for ApplicationInfoProvider();
  return -[ApplicationInfoProvider init](&v3, "init");
}

@end
