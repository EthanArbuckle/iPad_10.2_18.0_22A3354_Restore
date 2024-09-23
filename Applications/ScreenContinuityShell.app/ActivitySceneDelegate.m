@implementation ActivitySceneDelegate

- (UIWindow)window
{
  return (UIWindow *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                             + OBJC_IVAR____TtC21ScreenContinuityShell21ActivitySceneDelegate_window));
}

- (void)setWindow:(id)a3
{
  id v3;
  id v4;

  v4 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC21ScreenContinuityShell21ActivitySceneDelegate_window);
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC21ScreenContinuityShell21ActivitySceneDelegate_window) = (Class)a3;
  v3 = a3;

}

- (void)scene:(id)a3 willConnectToSession:(id)a4 options:(id)a5
{
  id v8;
  id v9;
  id v10;
  _TtC21ScreenContinuityShell21ActivitySceneDelegate *v11;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = self;
  sub_10000B148(v8, v9);

}

- (_TtC21ScreenContinuityShell21ActivitySceneDelegate)init
{
  objc_super v3;

  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC21ScreenContinuityShell21ActivitySceneDelegate_window) = 0;
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for ActivitySceneDelegate();
  return -[ActivitySceneDelegate init](&v3, "init");
}

- (void).cxx_destruct
{

}

@end
