@implementation AppSceneDelegate

- (BOOL)respondsToSelector:(SEL)a3
{
  _TtC7SwiftUI16AppSceneDelegate *v4;

  v4 = self;
  LOBYTE(a3) = AppSceneDelegate.responds(to:)((uint64_t)a3);

  return a3 & 1;
}

- (UIWindow)window
{
  return (UIWindow *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.isa
                                                             + OBJC_IVAR____TtC7SwiftUI16AppSceneDelegate_window));
}

- (_TtC7SwiftUI16AppSceneDelegate)init
{
  return (_TtC7SwiftUI16AppSceneDelegate *)AppSceneDelegate.init()();
}

- (void)scene:(id)a3 willConnectToSession:(id)a4 options:(id)a5
{
  UIScene *v8;
  id v9;
  id v10;
  _TtC7SwiftUI16AppSceneDelegate *v11;

  v8 = (UIScene *)a3;
  v9 = a4;
  v10 = a5;
  v11 = self;
  AppSceneDelegate.scene(_:willConnectTo:options:)(v8, (UISceneSession)v9, (UISceneConnectionOptions)v10);

}

- (id)stateRestorationActivityForScene:(id)a3
{
  id v4;
  _TtC7SwiftUI16AppSceneDelegate *v5;
  id v6;

  v4 = a3;
  v5 = self;
  v6 = specialized AppSceneDelegate.stateRestorationActivity(for:)();

  return v6;
}

- (void)sceneWillEnterForeground:(id)a3
{
  UIScene *v4;
  _TtC7SwiftUI16AppSceneDelegate *v5;

  v4 = (UIScene *)a3;
  v5 = self;
  AppSceneDelegate.sceneWillEnterForeground(_:)(v4);

}

- (void)sceneDidBecomeActive:(id)a3
{
  UIScene *v4;
  _TtC7SwiftUI16AppSceneDelegate *v5;

  v4 = (UIScene *)a3;
  v5 = self;
  AppSceneDelegate.sceneDidBecomeActive(_:)(v4);

}

- (void)setWindow:(id)a3
{
  id v3;
  id v4;

  v4 = *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC7SwiftUI16AppSceneDelegate_window);
  *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC7SwiftUI16AppSceneDelegate_window) = (Class)a3;
  v3 = a3;

}

- (void)sceneDidDisconnect:(id)a3
{
  UIScene *v4;
  _TtC7SwiftUI16AppSceneDelegate *v5;

  v4 = (UIScene *)a3;
  v5 = self;
  AppSceneDelegate.sceneDidDisconnect(_:)(v4);

}

- (void)scene:(id)a3 continueUserActivity:(id)a4
{
  UIScene *v6;
  id v7;
  _TtC7SwiftUI16AppSceneDelegate *v8;

  v6 = (UIScene *)a3;
  v7 = a4;
  v8 = self;
  AppSceneDelegate.scene(_:continue:)(v6, (NSUserActivity)v7);

}

- (void)scene:(id)a3 openURLContexts:(id)a4
{
  uint64_t v6;
  id v7;
  _TtC7SwiftUI16AppSceneDelegate *v8;

  type metadata accessor for NSObject(0, (unint64_t *)&lazy cache variable for type metadata for UIOpenURLContext);
  lazy protocol witness table accessor for type UIScene and conformance NSObject(&lazy protocol witness table cache variable for type UIOpenURLContext and conformance NSObject, (unint64_t *)&lazy cache variable for type metadata for UIOpenURLContext);
  v6 = static Set._unconditionallyBridgeFromObjectiveC(_:)();
  v7 = a3;
  v8 = self;
  AppSceneDelegate.scene(_:openURLContexts:)((uint64_t)v7, v6);

  swift_bridgeObjectRelease();
}

- (void)sceneWillResignActive:(id)a3
{
  UIScene *v4;
  _TtC7SwiftUI16AppSceneDelegate *v5;

  v4 = (UIScene *)a3;
  v5 = self;
  AppSceneDelegate.sceneWillResignActive(_:)(v4);

}

- (void)sceneDidEnterBackground:(id)a3
{
  UIScene *v4;
  _TtC7SwiftUI16AppSceneDelegate *v5;

  v4 = (UIScene *)a3;
  v5 = self;
  AppSceneDelegate.sceneDidEnterBackground(_:)(v4);

}

- (id)forwardingTargetForSelector:(SEL)a3
{
  _TtC7SwiftUI16AppSceneDelegate *v3;
  uint64_t v4;
  _QWORD *v5;
  uint64_t v6;
  double v7;
  uint64_t v8;
  char *v9;
  void *v10;
  _QWORD v12[3];
  uint64_t v13;

  v3 = self;
  AppSceneDelegate.forwardingTarget(for:)((uint64_t)v12);

  v4 = v13;
  if (!v13)
    return 0;
  v5 = __swift_project_boxed_opaque_existential_1(v12, v13);
  v6 = *(_QWORD *)(v4 - 8);
  v7 = MEMORY[0x1E0C80A78](v5, v5);
  v9 = (char *)v12 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, double))(v6 + 16))(v9, v7);
  v10 = (void *)_bridgeAnythingToObjectiveC<A>(_:)();
  (*(void (**)(char *, uint64_t))(v6 + 8))(v9, v4);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v12);
  return v10;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC7SwiftUI16AppSceneDelegate____lazy_storage___appDelegate));

  outlined consume of SceneID?(*(uint64_t *)((char *)&self->super.super.isa + OBJC_IVAR____TtC7SwiftUI16AppSceneDelegate_sceneItemID), *(_QWORD *)((char *)&self->super._responderFlags + OBJC_IVAR____TtC7SwiftUI16AppSceneDelegate_sceneItemID), *((_BYTE *)&self->super.__layeringSceneIdentity + OBJC_IVAR____TtC7SwiftUI16AppSceneDelegate_sceneItemID));
  swift_release();
  swift_release();
  swift_release();
  outlined consume of Data?(*(uint64_t *)((char *)&self->super.super.isa + OBJC_IVAR____TtC7SwiftUI16AppSceneDelegate_rawPresentationDataValue), *(_QWORD *)((char *)&self->super._responderFlags+ OBJC_IVAR____TtC7SwiftUI16AppSceneDelegate_rawPresentationDataValue));
  outlined destroy of AccessibilityTableContext?((uint64_t)self + OBJC_IVAR____TtC7SwiftUI16AppSceneDelegate_presentationDataValue, (unint64_t *)&lazy cache variable for type metadata for AnyHashable?, MEMORY[0x1E0DEC198]);
}

@end
