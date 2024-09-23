@implementation TestingAppDelegate

- (BOOL)application:(id)a3 didFinishLaunchingWithOptions:(id)a4
{
  return 1;
}

- (id)application:(id)a3 configurationForConnectingSceneSession:(id)a4 options:(id)a5
{
  id v8;
  id v9;
  id v10;
  _TtC7SwiftUI18TestingAppDelegate *v11;
  id v12;
  id v13;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = self;
  v12 = objc_msgSend(v9, sel_role);
  v13 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0DC3BD8]), sel_initWithName_sessionRole_, 0, v12);

  type metadata accessor for TestingSceneDelegate();
  objc_msgSend(v13, sel_setDelegateClass_, swift_getObjCClassFromMetadata());

  return v13;
}

- (BOOL)application:(id)a3 runTest:(id)a4 options:(id)a5
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  _TtC7SwiftUI18TestingAppDelegate *v11;

  v7 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  v9 = v8;
  static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();
  v10 = a3;
  v11 = self;
  LOBYTE(v7) = specialized TestingAppDelegate.application(_:runTest:options:)(v10, v7, v9);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v7 & 1;
}

- (_TtC7SwiftUI18TestingAppDelegate)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for TestingAppDelegate();
  return -[TestingAppDelegate init](&v3, sel_init);
}

@end
