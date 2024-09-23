@implementation AppDelegate

- (BOOL)application:(id)a3 didFinishLaunchingWithOptions:(id)a4
{
  id v4;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  void *v10;
  id v11;
  _TtC10ClockAngel11AppDelegate *v12;
  NSString v13;

  v4 = a4;
  if (a4)
  {
    type metadata accessor for LaunchOptionsKey(0);
    v8 = v7;
    v9 = sub_10004666C();
    v4 = (id)static Dictionary._unconditionallyBridgeFromObjectiveC(_:)(v4, v8, (char *)&type metadata for Any + 8, v9);
  }
  v10 = (void *)objc_opt_self(MTSessionUtilities);
  v11 = a3;
  v12 = self;
  v13 = String._bridgeToObjectiveC()();
  objc_msgSend(v10, "logInfo:", v13);

  swift_bridgeObjectRelease(v4);
  return 1;
}

- (id)application:(id)a3 configurationForConnectingSceneSession:(id)a4 options:(id)a5
{
  id v8;
  id v9;
  id v10;
  _TtC10ClockAngel11AppDelegate *v11;
  id v12;
  id v13;
  NSString v14;
  id v15;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = self;
  v12 = objc_msgSend(v9, "role");
  v13 = objc_allocWithZone((Class)UISceneConfiguration);
  v14 = String._bridgeToObjectiveC()();
  v15 = objc_msgSend(v13, "initWithName:sessionRole:", v14, v12);

  return v15;
}

- (_TtC10ClockAngel11AppDelegate)init
{
  uint64_t v2;
  uint64_t v3;
  _TtC10ClockAngel11AppDelegate *v4;
  void *v5;
  id v6;
  objc_super v8;

  v2 = OBJC_IVAR____TtC10ClockAngel11AppDelegate_connectionHandler;
  v3 = qword_1000AECE8;
  v4 = self;
  if (v3 != -1)
    swift_once(&qword_1000AECE8, sub_1000478C4);
  v5 = (void *)qword_1000B6F08;
  *(Class *)((char *)&v4->super.super.isa + v2) = (Class)qword_1000B6F08;
  v6 = v5;

  v8.receiver = v4;
  v8.super_class = (Class)type metadata accessor for AppDelegate();
  return -[AppDelegate init](&v8, "init");
}

- (void).cxx_destruct
{

}

@end
