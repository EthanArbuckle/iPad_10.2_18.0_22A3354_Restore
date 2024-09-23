@implementation SceneDelegate

- (UIWindow)window
{
  return (UIWindow *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.isa
                                                             + OBJC_IVAR____TtC8SOSBuddy13SceneDelegate_window));
}

- (void)setWindow:(id)a3
{
  id v3;
  id v4;

  v4 = *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC8SOSBuddy13SceneDelegate_window);
  *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC8SOSBuddy13SceneDelegate_window) = (Class)a3;
  v3 = a3;

}

- (void)scene:(id)a3 willConnectToSession:(id)a4 options:(id)a5
{
  id v8;
  id v9;
  id v10;
  _TtC8SOSBuddy13SceneDelegate *v11;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = self;
  sub_10002C7B4(v8, v9, v10);

}

- (void)scene:(id)a3 openURLContexts:(id)a4
{
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  _TtC8SOSBuddy13SceneDelegate *v11;

  v7 = sub_1000226C8();
  v8 = sub_1000052EC((unint64_t *)&unk_1003184C0, (uint64_t (*)(uint64_t))sub_1000226C8, (uint64_t)&protocol conformance descriptor for NSObject);
  v9 = static Set._unconditionallyBridgeFromObjectiveC(_:)(a4, v7, v8);
  v10 = a3;
  v11 = self;
  sub_10002DDF0(v9);

  swift_bridgeObjectRelease(v9);
}

- (void)sceneDidDisconnect:(id)a3
{
  id v4;
  _TtC8SOSBuddy13SceneDelegate *v5;

  v4 = a3;
  v5 = self;
  sub_10002CE00(v4);

}

- (void)sceneDidBecomeActive:(id)a3
{
  id v4;
  _TtC8SOSBuddy13SceneDelegate *v5;

  v4 = a3;
  v5 = self;
  sub_10002CE60(v4);

}

- (void)sceneWillResignActive:(id)a3
{
  id v4;
  _TtC8SOSBuddy13SceneDelegate *v5;

  v4 = a3;
  v5 = self;
  sub_10002CEC0(v4);

}

- (void)sceneWillEnterForeground:(id)a3
{
  id v4;
  _TtC8SOSBuddy13SceneDelegate *v5;

  v4 = a3;
  v5 = self;
  sub_10002D1A8(v4);

}

- (void)sceneDidEnterBackground:(id)a3
{
  id v4;
  _TtC8SOSBuddy13SceneDelegate *v5;

  v4 = a3;
  v5 = self;
  sub_10002D20C(v4);

}

- (_TtC8SOSBuddy13SceneDelegate)init
{
  objc_super v3;

  *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC8SOSBuddy13SceneDelegate_window) = 0;
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for SceneDelegate();
  return -[SceneDelegate init](&v3, "init");
}

- (void).cxx_destruct
{

}

@end
