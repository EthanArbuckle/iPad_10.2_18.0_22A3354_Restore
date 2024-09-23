@implementation AppDelegate

- (BOOL)application:(id)a3 didFinishLaunchingWithOptions:(id)a4
{
  id v4;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  _TtC12PreviewShell11AppDelegate *v12;

  v4 = a4;
  if (a4)
  {
    type metadata accessor for LaunchOptionsKey(0);
    v8 = v7;
    v9 = sub_100006618((unint64_t *)&unk_1000608A0, (uint64_t (*)(uint64_t))type metadata accessor for LaunchOptionsKey, (uint64_t)&unk_10003FE38);
    v4 = (id)static Dictionary._unconditionallyBridgeFromObjectiveC(_:)(v4, v8, (char *)&type metadata for Any + 8, v9);
  }
  v10 = qword_10005EC98;
  v11 = a3;
  v12 = self;
  if (v10 != -1)
    swift_once(&qword_10005EC98, sub_10001501C);
  type metadata accessor for PreviewShellService(0);
  sub_100006618(&qword_100060898, type metadata accessor for PreviewShellService, (uint64_t)&unk_100040684);
  PreviewShellServiceProtocol.activateServers()();

  swift_bridgeObjectRelease(v4);
  return 1;
}

- (id)application:(id)a3 configurationForConnectingSceneSession:(id)a4 options:(id)a5
{
  id v8;
  id v9;
  id v10;
  _TtC12PreviewShell11AppDelegate *v11;
  id v12;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = self;
  v12 = sub_10002E5DC(v9);

  return v12;
}

- (_TtC12PreviewShell11AppDelegate)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for AppDelegate();
  return -[AppDelegate init](&v3, "init");
}

@end
