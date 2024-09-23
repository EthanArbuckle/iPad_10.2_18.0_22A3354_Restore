@implementation ClimateSceneDelegate

- (UIWindow)window
{
  return (UIWindow *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.isa
                                                             + OBJC_IVAR____TtC7Climate20ClimateSceneDelegate_window));
}

- (void)setWindow:(id)a3
{
  id v3;
  id v4;

  v4 = *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC7Climate20ClimateSceneDelegate_window);
  *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC7Climate20ClimateSceneDelegate_window) = (Class)a3;
  v3 = a3;

}

- (void)scene:(id)a3 willConnectToSession:(id)a4 options:(id)a5
{
  id v8;
  id v9;
  id v10;
  _TtC7Climate20ClimateSceneDelegate *v11;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = self;
  sub_10007DC90(v8, v9);

}

- (void)sceneDidDisconnect:(id)a3
{
  id v4;
  _TtC7Climate20ClimateSceneDelegate *v5;

  v4 = a3;
  v5 = self;
  sub_10007C498(v4);

}

- (void)sceneDidBecomeActive:(id)a3
{
  id v4;
  _TtC7Climate20ClimateSceneDelegate *v5;

  v4 = a3;
  v5 = self;
  sub_10007CB48(1);

}

- (void)sceneWillResignActive:(id)a3
{
  id v4;
  _TtC7Climate20ClimateSceneDelegate *v5;

  v4 = a3;
  v5 = self;
  sub_10007CB48(0);

}

- (void)sceneWillEnterForeground:(id)a3
{
  id v4;
  _TtC7Climate20ClimateSceneDelegate *v5;

  v4 = a3;
  v5 = self;
  sub_10007E6B8();

}

- (void)sceneDidEnterBackground:(id)a3
{
  id v4;
  _TtC7Climate20ClimateSceneDelegate *v5;

  v4 = a3;
  v5 = self;
  sub_10007E884();

}

- (void)scene:(id)a3 didUpdateSettings:(id)a4
{
  id v6;
  id v7;
  _TtC7Climate20ClimateSceneDelegate *v8;

  v6 = a3;
  v7 = a4;
  v8 = self;
  sub_10007EB04(v6, v7);

}

- (_TtC7Climate20ClimateSceneDelegate)init
{
  return (_TtC7Climate20ClimateSceneDelegate *)sub_10007D05C();
}

- (void).cxx_destruct
{

  sub_10002C6A0(*(uint64_t *)((char *)&self->super.super.isa + OBJC_IVAR____TtC7Climate20ClimateSceneDelegate_type), *(_QWORD *)&self->window[OBJC_IVAR____TtC7Climate20ClimateSceneDelegate_type], self->type[OBJC_IVAR____TtC7Climate20ClimateSceneDelegate_type]);
  swift_bridgeObjectRelease(*(_QWORD *)&self->window[OBJC_IVAR____TtC7Climate20ClimateSceneDelegate_persistentIdentifier]);
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.isa
                                     + OBJC_IVAR____TtC7Climate20ClimateSceneDelegate_cancellables));
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC7Climate20ClimateSceneDelegate_statusBarStyleAssertion));
}

- (void)scene:(id)a3 openURLContexts:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  _TtC7Climate20ClimateSceneDelegate *v11;

  v7 = sub_100006B04(0, &qword_1000BA170, UIOpenURLContext_ptr);
  v8 = sub_10007F724(&qword_1000BA178, &qword_1000BA170, UIOpenURLContext_ptr, (uint64_t)&protocol conformance descriptor for NSObject);
  v9 = static Set._unconditionallyBridgeFromObjectiveC(_:)(a4, v7, v8);
  v10 = a3;
  v11 = self;
  sub_10007EE3C(v9);

  swift_bridgeObjectRelease(v9);
}

@end
