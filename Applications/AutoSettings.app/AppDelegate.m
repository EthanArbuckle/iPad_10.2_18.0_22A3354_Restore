@implementation AppDelegate

- (BOOL)application:(id)a3 didFinishLaunchingWithOptions:(id)a4
{
  id v4;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  id v10;
  _TtC12AutoSettings11AppDelegate *v11;
  objc_class *v12;
  void *v13;

  v4 = a4;
  if (a4)
  {
    type metadata accessor for LaunchOptionsKey(0);
    v8 = v7;
    v9 = sub_10000C1FC();
    v4 = (id)static Dictionary._unconditionallyBridgeFromObjectiveC(_:)(v4, v8, (char *)&type metadata for Any + 8, v9);
  }
  v10 = a3;
  v11 = self;
  CAFSignpostEmit_Launched();
  v12 = (objc_class *)objc_msgSend(objc_allocWithZone((Class)type metadata accessor for SettingsCarManager(0)), "init");
  v13 = *(Class *)((char *)&v11->super.super.isa + OBJC_IVAR____TtC12AutoSettings11AppDelegate_settingsCarManager);
  *(Class *)((char *)&v11->super.super.isa + OBJC_IVAR____TtC12AutoSettings11AppDelegate_settingsCarManager) = v12;

  swift_bridgeObjectRelease(v4);
  return 1;
}

- (_TtC12AutoSettings11AppDelegate)init
{
  return (_TtC12AutoSettings11AppDelegate *)sub_10000BD70();
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;
  void (*v5)(char *, uint64_t);

  v3 = (char *)self + OBJC_IVAR____TtC12AutoSettings11AppDelegate__carWindow;
  v4 = sub_100005888(&qword_100028340);
  v5 = *(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8);
  v5(v3, v4);
  v5((char *)self + OBJC_IVAR____TtC12AutoSettings11AppDelegate__clusterWindow, v4);
}

@end
