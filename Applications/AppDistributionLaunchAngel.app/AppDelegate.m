@implementation AppDelegate

- (BOOL)application:(id)a3 didFinishLaunchingWithOptions:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  _TtC26AppDistributionLaunchAngel11AppDelegate *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;

  v7 = type metadata accessor for MainActor(0, a2);
  v8 = static MainActor.shared.getter(v7);
  v9 = dispatch thunk of Actor.unownedExecutor.getter(v7, &protocol witness table for MainActor);
  v11 = v10;
  if ((swift_task_isCurrentExecutor(v9) & 1) == 0)
    swift_task_reportUnexpectedExecutor("AppDistributionLaunchAngel/AppDelegate.swift", 44, 1, 14, v9, v11);
  if (a4)
  {
    type metadata accessor for LaunchOptionsKey(0);
    v13 = v12;
    v14 = sub_100005954(&qword_1000480B8, (uint64_t (*)(uint64_t))type metadata accessor for LaunchOptionsKey, (uint64_t)&unk_10003344C);
    a4 = (id)static Dictionary._unconditionallyBridgeFromObjectiveC(_:)(a4, v13, (char *)&type metadata for Any + 8, v14);
  }
  v15 = a3;
  v16 = self;
  v17 = static MainActor.shared.getter(v16);
  v18 = dispatch thunk of Actor.unownedExecutor.getter(v7, &protocol witness table for MainActor);
  v20 = v19;
  if ((swift_task_isCurrentExecutor(v18) & 1) == 0)
    swift_task_reportUnexpectedExecutor("AppDistributionLaunchAngel/AppDelegate.swift", 44, 1, 14, v18, v20);
  swift_bridgeObjectRelease(a4);
  swift_release(v17);
  swift_release(v8);

  return 1;
}

- (id)application:(id)a3 configurationForConnectingSceneSession:(id)a4 options:(id)a5
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  id v15;
  id v16;
  _TtC26AppDistributionLaunchAngel11AppDelegate *v17;
  id v18;

  v9 = type metadata accessor for MainActor(0, a2);
  v10 = static MainActor.shared.getter(v9);
  v11 = dispatch thunk of Actor.unownedExecutor.getter(v9, &protocol witness table for MainActor);
  v13 = v12;
  if ((swift_task_isCurrentExecutor(v11) & 1) == 0)
    swift_task_reportUnexpectedExecutor("AppDistributionLaunchAngel/AppDelegate.swift", 44, 1, 18, v11, v13);
  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = self;
  v18 = sub_10000E34C(v14, v15, v16);
  swift_release(v10);

  return v18;
}

- (_TtC26AppDistributionLaunchAngel11AppDelegate)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for AppDelegate();
  return -[AppDelegate init](&v3, "init");
}

@end
