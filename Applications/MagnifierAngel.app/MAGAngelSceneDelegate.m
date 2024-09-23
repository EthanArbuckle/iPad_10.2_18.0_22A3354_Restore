@implementation MAGAngelSceneDelegate

- (void)scene:(id)a3 willConnectToSession:(id)a4 options:(id)a5
{
  id v8;
  id v9;
  id v10;
  _TtC14MagnifierAngel21MAGAngelSceneDelegate *v11;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = self;
  sub_100022AE4(v8);

}

- (_TtC14MagnifierAngel21MAGAngelSceneDelegate)init
{
  objc_class *ObjectType;
  objc_super v5;

  ObjectType = (objc_class *)swift_getObjectType(self, a2);
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC14MagnifierAngel21MAGAngelSceneDelegate_window) = 0;
  v5.receiver = self;
  v5.super_class = ObjectType;
  return -[MAGAngelSceneDelegate init](&v5, "init");
}

- (void).cxx_destruct
{

}

@end
