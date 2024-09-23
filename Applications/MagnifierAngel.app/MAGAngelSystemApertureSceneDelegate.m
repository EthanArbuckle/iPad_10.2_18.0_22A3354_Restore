@implementation MAGAngelSystemApertureSceneDelegate

- (void)scene:(id)a3 willConnectToSession:(id)a4 options:(id)a5
{
  id v8;
  id v9;
  id v10;
  _TtC14MagnifierAngel35MAGAngelSystemApertureSceneDelegate *v11;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = self;
  sub_100022DBC(v8);

}

- (_TtC14MagnifierAngel35MAGAngelSystemApertureSceneDelegate)init
{
  objc_class *ObjectType;
  uint64_t v4;
  uint64_t v5;
  id v6;
  _TtC14MagnifierAngel35MAGAngelSystemApertureSceneDelegate *v7;
  objc_super v9;

  ObjectType = (objc_class *)swift_getObjectType(self, a2);
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC14MagnifierAngel35MAGAngelSystemApertureSceneDelegate_window) = 0;
  v4 = OBJC_IVAR____TtC14MagnifierAngel35MAGAngelSystemApertureSceneDelegate_systemApertureElementProvider;
  v5 = type metadata accessor for MAGAngelSystemApertureViewController();
  v6 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata(v5));
  v7 = self;
  *(Class *)((char *)&self->super.isa + v4) = (Class)objc_msgSend(v6, "init");

  v9.receiver = v7;
  v9.super_class = ObjectType;
  return -[MAGAngelSystemApertureSceneDelegate init](&v9, "init");
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC14MagnifierAngel35MAGAngelSystemApertureSceneDelegate_window));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC14MagnifierAngel35MAGAngelSystemApertureSceneDelegate_systemApertureElementProvider));
}

@end
