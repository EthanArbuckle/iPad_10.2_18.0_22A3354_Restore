@implementation DefaultSceneDelegate

- (UIWindow)window
{
  return (UIWindow *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.isa
                                                             + OBJC_IVAR____TtC22ProximityReaderSceneUI20DefaultSceneDelegate_window));
}

- (void)setWindow:(id)a3
{
  id v3;
  id v4;

  v4 = *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC22ProximityReaderSceneUI20DefaultSceneDelegate_window);
  *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC22ProximityReaderSceneUI20DefaultSceneDelegate_window) = (Class)a3;
  v3 = a3;

}

- (void)scene:(id)a3 willConnectToSession:(id)a4 options:(id)a5
{
  void (**v8)(char *, uint64_t);
  id v9;
  id v10;
  _TtC22ProximityReaderSceneUI20DefaultSceneDelegate *v11;

  v8 = (void (**)(char *, uint64_t))a3;
  v9 = a4;
  v10 = a5;
  v11 = self;
  sub_10000E9C8(v8, v9);

}

- (_TtC22ProximityReaderSceneUI20DefaultSceneDelegate)init
{
  objc_super v3;

  *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC22ProximityReaderSceneUI20DefaultSceneDelegate_window) = 0;
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for DefaultSceneDelegate();
  return -[DefaultSceneDelegate init](&v3, "init");
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC22ProximityReaderSceneUI20DefaultSceneDelegate_window));
}

@end
