@implementation AppDelegate

- (BOOL)application:(id)a3 didFinishLaunchingWithOptions:(id)a4
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  if (a4)
  {
    type metadata accessor for LaunchOptionsKey();
    v6 = v5;
    sub_100004F60(&qword_10001E2B0, (uint64_t (*)(uint64_t))type metadata accessor for LaunchOptionsKey, (uint64_t)&unk_100012E04);
    v8 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)(a4, v6, (char *)&type metadata for Any + 8, v7);
  }
  else
  {
    v8 = 0;
  }
  swift_bridgeObjectRelease(v8);
  return 1;
}

- (id)application:(id)a3 configurationForConnectingSceneSession:(id)a4 options:(id)a5
{
  id v8;
  id v9;
  id v10;
  _TtC24AMSEngagementViewService11AppDelegate *v11;
  void *v12;
  void *v13;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = self;
  sub_100004804((int)v11, v9);
  v13 = v12;

  return v13;
}

- (void)application:(id)a3 didDiscardSceneSessions:(id)a4
{
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v5 = sub_100004AD4();
  sub_100004F60(&qword_10001E2A8, (uint64_t (*)(uint64_t))sub_100004AD4, (uint64_t)&protocol conformance descriptor for NSObject);
  v7 = static Set._unconditionallyBridgeFromObjectiveC(_:)(a4, v5, v6);
  swift_bridgeObjectRelease(v7);
}

- (_TtC24AMSEngagementViewService11AppDelegate)init
{
  return (_TtC24AMSEngagementViewService11AppDelegate *)sub_100004930();
}

@end
