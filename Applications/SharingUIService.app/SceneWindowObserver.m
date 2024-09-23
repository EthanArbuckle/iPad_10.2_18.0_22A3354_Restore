@implementation SceneWindowObserver

- (UIScene)_scene
{
  return (UIScene *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                            + OBJC_IVAR____TtC16SharingUIService19SceneWindowObserver__scene));
}

- (void)_setScene:(id)a3
{
  id v3;
  id v4;

  v4 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC16SharingUIService19SceneWindowObserver__scene);
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC16SharingUIService19SceneWindowObserver__scene) = (Class)a3;
  v3 = a3;

}

- (_TtC16SharingUIService19SceneWindowObserver)initWithScene:(id)a3
{
  id v4;
  _TtC16SharingUIService19SceneWindowObserver *v5;
  objc_super v7;

  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC16SharingUIService19SceneWindowObserver__scene) = (Class)a3;
  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for SceneWindowObserver((uint64_t)self, (uint64_t)a2);
  v4 = a3;
  v5 = -[SceneWindowObserver init](&v7, "init");

  return v5;
}

- (id)_settingsDiffActionsForScene:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  id v9;
  _TtC16SharingUIService19SceneWindowObserver *v10;
  id v11;
  Class isa;

  v5 = sub_100009344(&qword_10003F348);
  v6 = swift_allocObject(v5, 40, 7);
  *(_OWORD *)(v6 + 16) = xmmword_100027B50;
  v8 = objc_allocWithZone((Class)type metadata accessor for SceneSettingsDiffAction(v6, v7));
  v9 = a3;
  v10 = self;
  v11 = objc_msgSend(v8, "init");
  *(_QWORD *)(v6 + 32) = v11;
  specialized Array._endMutation()(v11);

  sub_100009344((uint64_t *)&unk_1000403D0);
  isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v6);
  return isa;
}

- (_TtC16SharingUIService19SceneWindowObserver)init
{
  _TtC16SharingUIService19SceneWindowObserver *result;

  result = (_TtC16SharingUIService19SceneWindowObserver *)_swift_stdlib_reportUnimplementedInitializer("SharingUIService.SceneWindowObserver", 36, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{

}

@end
