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
  _TtC24ProximityReaderUIService11AppDelegate *v11;
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

- (_TtC24ProximityReaderUIService11AppDelegate)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for AppDelegate();
  return -[AppDelegate init](&v3, "init");
}

@end
