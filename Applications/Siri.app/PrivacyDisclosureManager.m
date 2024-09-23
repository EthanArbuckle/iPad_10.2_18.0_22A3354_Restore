@implementation PrivacyDisclosureManager

+ (BOOL)appRequiresPreflightWithAppBundleId:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  id v6;
  void *v8;
  unsigned __int8 v9;

  v3 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v5 = v4;
  objc_allocWithZone((Class)LSApplicationRecord);
  swift_bridgeObjectRetain(v5);
  v6 = sub_100076BA4(v3, v5, 0);
  v8 = v6;
  if (v6)
  {
    if (qword_10014EC88 != -1)
      swift_once(&qword_10014EC88, sub_1000769DC);
    v9 = objc_msgSend((id)qword_10014F530, "requiresPreflightForApplicationRecord:", v8);
    swift_bridgeObjectRelease(v5);

    return v9;
  }
  else
  {
    swift_bridgeObjectRelease(v5);
    return 0;
  }
}

- (_TtC4Siri24PrivacyDisclosureManager)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for PrivacyDisclosureManager();
  return -[PrivacyDisclosureManager init](&v3, "init");
}

@end
