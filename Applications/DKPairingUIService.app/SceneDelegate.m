@implementation SceneDelegate

- (UIWindow)window
{
  return (UIWindow *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.isa
                                                             + OBJC_IVAR____TtC18DKPairingUIService13SceneDelegate_window));
}

- (void)setWindow:(id)a3
{
  id v3;
  id v4;

  v4 = *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC18DKPairingUIService13SceneDelegate_window);
  *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC18DKPairingUIService13SceneDelegate_window) = (Class)a3;
  v3 = a3;

}

- (void)scene:(id)a3 openURLContexts:(id)a4
{
  unint64_t v7;
  unint64_t v8;
  uint64_t v9;
  id v10;
  _TtC18DKPairingUIService13SceneDelegate *v11;

  v7 = sub_10000E090();
  v8 = sub_10000E0CC();
  v9 = static Set._unconditionallyBridgeFromObjectiveC(_:)(a4, v7, v8);
  v10 = a3;
  v11 = self;
  sub_10000DC28(v9);

  swift_bridgeObjectRelease(v9);
}

- (void)scene:(id)a3 willConnectToSession:(id)a4 options:(id)a5
{
  id v8;
  id v9;
  id v10;
  _TtC18DKPairingUIService13SceneDelegate *v11;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = self;
  sub_10000DE2C((uint64_t)v8, v10);

}

- (_TtC18DKPairingUIService13SceneDelegate)init
{
  objc_super v3;

  *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC18DKPairingUIService13SceneDelegate_window) = 0;
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for SceneDelegate();
  return -[SceneDelegate init](&v3, "init");
}

- (void).cxx_destruct
{

}

@end
