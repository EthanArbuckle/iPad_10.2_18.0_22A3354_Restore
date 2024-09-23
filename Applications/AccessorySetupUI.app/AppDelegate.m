@implementation AppDelegate

- (BOOL)application:(id)a3 didFinishLaunchingWithOptions:(id)a4
{
  return 1;
}

- (id)application:(id)a3 configurationForConnectingSceneSession:(id)a4 options:(id)a5
{
  id v8;
  id v9;
  id v10;
  _TtC16AccessorySetupUI11AppDelegate *v11;
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

- (_TtC16AccessorySetupUI11AppDelegate)init
{
  uint64_t v2;
  uint64_t v3;
  _TtC16AccessorySetupUI11AppDelegate *v4;
  void *v5;
  id v6;
  objc_super v8;

  v2 = OBJC_IVAR____TtC16AccessorySetupUI11AppDelegate_sessionManager;
  v3 = qword_10005A990;
  v4 = self;
  if (v3 != -1)
    swift_once(&qword_10005A990, sub_100031ED0);
  v5 = (void *)qword_10005CA70;
  *(Class *)((char *)&v4->super.super.isa + v2) = (Class)qword_10005CA70;
  v6 = v5;

  v8.receiver = v4;
  v8.super_class = (Class)type metadata accessor for AppDelegate();
  return -[AppDelegate init](&v8, "init");
}

- (void).cxx_destruct
{

}

@end
