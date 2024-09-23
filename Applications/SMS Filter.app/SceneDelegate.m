@implementation SceneDelegate

- (UIWindow)window
{
  id *v2;
  _BYTE v4[24];

  v2 = (id *)((char *)&self->super.super.isa + OBJC_IVAR____TtC10SMS_Filter13SceneDelegate_window);
  swift_beginAccess((char *)self + OBJC_IVAR____TtC10SMS_Filter13SceneDelegate_window, v4, 0, 0);
  return (UIWindow *)*v2;
}

- (void)setWindow:(id)a3
{
  void **v4;
  void *v5;
  id v6;
  _BYTE v7[24];

  v4 = (void **)((char *)&self->super.super.isa + OBJC_IVAR____TtC10SMS_Filter13SceneDelegate_window);
  swift_beginAccess((char *)self + OBJC_IVAR____TtC10SMS_Filter13SceneDelegate_window, v7, 1, 0);
  v5 = *v4;
  *v4 = a3;
  v6 = a3;

}

- (_TtC10SMS_Filter13SceneDelegate)init
{
  objc_super v3;

  *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC10SMS_Filter13SceneDelegate_window) = 0;
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for SceneDelegate();
  return -[SceneDelegate init](&v3, "init");
}

- (void).cxx_destruct
{

}

@end
