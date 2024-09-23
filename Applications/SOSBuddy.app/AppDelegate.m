@implementation AppDelegate

- (BOOL)application:(id)a3 didFinishLaunchingWithOptions:(id)a4
{
  id v4;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  _TtC8SOSBuddy11AppDelegate *v11;
  char v12;

  v4 = a4;
  if (a4)
  {
    type metadata accessor for LaunchOptionsKey(0);
    v8 = v7;
    v9 = sub_1000052EC((unint64_t *)&unk_100317D80, (uint64_t (*)(uint64_t))type metadata accessor for LaunchOptionsKey, (uint64_t)&unk_10024CCBC);
    v4 = (id)static Dictionary._unconditionallyBridgeFromObjectiveC(_:)(v4, v8, (char *)&type metadata for Any + 8, v9);
  }
  v10 = a3;
  v11 = self;
  v12 = sub_100021B14((uint64_t)v4);

  swift_bridgeObjectRelease(v4);
  return v12 & 1;
}

- (void)applicationWillTerminate:(id)a3
{
  uint64_t v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  NSObject *v8;
  os_log_type_t v9;
  uint8_t *v10;
  _TtC8SOSBuddy11AppDelegate *v11;

  v4 = qword_100315820;
  v5 = a3;
  v11 = self;
  if (v4 != -1)
    swift_once(&qword_100315820, sub_1000D95E4);
  v6 = type metadata accessor for Logger(0);
  v7 = sub_10000D744(v6, (uint64_t)qword_10033FD18);
  v8 = Logger.logObject.getter(v7);
  v9 = static os_log_type_t.default.getter(v8);
  if (os_log_type_enabled(v8, v9))
  {
    v10 = (uint8_t *)swift_slowAlloc(2, -1);
    *(_WORD *)v10 = 0;
    _os_log_impl((void *)&_mh_execute_header, v8, v9, "AppDelegate applicationWillTerminate()", v10, 2u);
    swift_slowDealloc(v10, -1, -1);
  }

  sub_10015CF40();
}

- (id)application:(id)a3 configurationForConnectingSceneSession:(id)a4 options:(id)a5
{
  id v8;
  id v9;
  id v10;
  _TtC8SOSBuddy11AppDelegate *v11;
  id v12;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = self;
  v12 = sub_1000222A8(v9, v10);

  return v12;
}

- (void)application:(id)a3 didDiscardSceneSessions:(id)a4
{
  uint64_t v5;
  _TtC8SOSBuddy11AppDelegate *v6;
  uint64_t v7;
  uint64_t v8;
  NSObject *v9;
  os_log_type_t v10;
  uint8_t *v11;
  id v12;

  v5 = qword_100315820;
  v12 = a3;
  v6 = self;
  if (v5 != -1)
    swift_once(&qword_100315820, sub_1000D95E4);
  v7 = type metadata accessor for Logger(0);
  v8 = sub_10000D744(v7, (uint64_t)qword_10033FD18);
  v9 = Logger.logObject.getter(v8);
  v10 = static os_log_type_t.debug.getter();
  if (os_log_type_enabled(v9, v10))
  {
    v11 = (uint8_t *)swift_slowAlloc(2, -1);
    *(_WORD *)v11 = 0;
    _os_log_impl((void *)&_mh_execute_header, v9, v10, "AppDelegate didDiscardSceneSessions()", v11, 2u);
    swift_slowDealloc(v11, -1, -1);
  }

}

- (_TtC8SOSBuddy11AppDelegate)init
{
  uint64_t *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _TtC8SOSBuddy11AppDelegate *v7;
  objc_super v9;

  v3 = (uint64_t *)((char *)self + OBJC_IVAR____TtC8SOSBuddy11AppDelegate_delegate);
  v4 = type metadata accessor for ProdAppDelegate();
  v5 = swift_allocObject(v4, 24, 7);
  v6 = type metadata accessor for SOSBuddyEnvironment();
  swift_allocObject(v6, 338, 7);
  v7 = self;
  *(_QWORD *)(v5 + 16) = sub_10016DF18();
  *v3 = v5;
  v3[1] = (uint64_t)&off_1002E58A8;

  v9.receiver = v7;
  v9.super_class = (Class)type metadata accessor for AppDelegate();
  return -[AppDelegate init](&v9, "init");
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease(*(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC8SOSBuddy11AppDelegate_delegate));
}

@end
