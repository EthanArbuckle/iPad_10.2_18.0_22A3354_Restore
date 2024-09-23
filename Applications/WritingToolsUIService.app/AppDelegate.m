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
  _TtC21WritingToolsUIService11AppDelegate *v11;
  id v12;
  id v13;
  uint64_t v14;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = self;
  v12 = objc_msgSend(v9, "role");
  v13 = objc_msgSend(objc_allocWithZone((Class)UISceneConfiguration), "initWithName:sessionRole:", 0, v12);

  v14 = type metadata accessor for SceneDelegate(0);
  objc_msgSend(v13, "setDelegateClass:", swift_getObjCClassFromMetadata(v14));

  return v13;
}

- (_TtC21WritingToolsUIService11AppDelegate)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for AppDelegate();
  return -[AppDelegate init](&v3, "init");
}

@end
