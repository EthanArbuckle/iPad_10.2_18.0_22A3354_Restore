@implementation TirePressureSceneDelegate

- (void)scene:(id)a3 willConnectToSession:(id)a4 options:(id)a5
{
  id v8;
  id v9;
  id v10;
  _TtC12TirePressure25TirePressureSceneDelegate *v11;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = self;
  sub_10000DBBC(v8, v9);

}

- (void)sceneDidDisconnect:(id)a3
{
  id v4;
  _TtC12TirePressure25TirePressureSceneDelegate *v5;

  v4 = a3;
  v5 = self;
  sub_10000D3A8(v4);

}

- (_TtC12TirePressure25TirePressureSceneDelegate)init
{
  objc_super v3;

  *(Class *)((char *)&self->super.super.isa
           + OBJC_IVAR____TtC12TirePressure25TirePressureSceneDelegate_clusterWindowManager) = 0;
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for TirePressureSceneDelegate();
  return -[TirePressureSceneDelegate init](&v3, "init");
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC12TirePressure25TirePressureSceneDelegate_clusterWindowManager));
}

- (void)selectButtonPressedWithType:(unint64_t)a3
{
  sub_10000E1E8(a3);
}

@end
