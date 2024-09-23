@implementation SceneDelegate

- (UIWindow)window
{
  return (UIWindow *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.isa
                                                             + OBJC_IVAR____TtC16SharingUIService13SceneDelegate_window));
}

- (void)setWindow:(id)a3
{
  id v3;
  id v4;

  v4 = *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC16SharingUIService13SceneDelegate_window);
  *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC16SharingUIService13SceneDelegate_window) = (Class)a3;
  v3 = a3;

}

- (void)scene:(id)a3 willConnectToSession:(id)a4 options:(id)a5
{
  id v8;
  id v9;
  id v10;
  _TtC16SharingUIService13SceneDelegate *v11;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = self;
  sub_100017850(v8);

}

- (void)sceneDidDisconnect:(id)a3
{
  id v4;
  _TtC16SharingUIService13SceneDelegate *v5;

  v4 = a3;
  v5 = self;
  sub_100017160(v4);

}

- (_TtC16SharingUIService13SceneDelegate)init
{
  uint64_t v3;
  _TtC16SharingUIService13SceneDelegate *v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  objc_super v9;

  v3 = OBJC_IVAR____TtC16SharingUIService13SceneDelegate_sceneComponentKey;
  sub_100017814(0, (uint64_t)a2);
  v4 = self;
  *(Class *)((char *)&self->super.super.isa + v3) = (Class)NSString.init(stringLiteral:)("SharingUIServiceSceneComponentKey", 33, 2);
  v5 = (char *)v4 + OBJC_IVAR____TtC16SharingUIService13SceneDelegate_sceneSession;
  *((_QWORD *)v5 + 1) = 0;
  swift_unknownObjectWeakInit(v5, 0);
  *(Class *)((char *)&v4->super.super.isa + OBJC_IVAR____TtC16SharingUIService13SceneDelegate_window) = 0;
  *((_BYTE *)&v4->super.super.isa + OBJC_IVAR____TtC16SharingUIService13SceneDelegate_isModernScene) = 0;

  v9.receiver = v4;
  v9.super_class = (Class)type metadata accessor for SceneDelegate(v6, v7);
  return -[SceneDelegate init](&v9, "init");
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC16SharingUIService13SceneDelegate_sceneComponentKey));
  sub_100017E40((uint64_t)self + OBJC_IVAR____TtC16SharingUIService13SceneDelegate_sceneSession);

}

@end
