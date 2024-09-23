@implementation GameOverlayUISceneDelegate

- (UIWindow)window
{
  return (UIWindow *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                             + OBJC_IVAR____TtC13GameOverlayUI26GameOverlayUISceneDelegate_window));
}

- (void)setWindow:(id)a3
{
  id v3;
  id v4;

  v4 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC13GameOverlayUI26GameOverlayUISceneDelegate_window);
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC13GameOverlayUI26GameOverlayUISceneDelegate_window) = (Class)a3;
  v3 = a3;

}

- (void)scene:(id)a3 willConnectToSession:(id)a4 options:(id)a5
{
  id v8;
  id v9;
  id v10;
  _TtC13GameOverlayUI26GameOverlayUISceneDelegate *v11;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = self;
  sub_1000B05F0(v9);

}

- (_TtC13GameOverlayUI26GameOverlayUISceneDelegate)init
{
  return (_TtC13GameOverlayUI26GameOverlayUISceneDelegate *)sub_1000AD698((char *)self, (uint64_t)a2, &OBJC_IVAR____TtC13GameOverlayUI26GameOverlayUISceneDelegate_window);
}

- (void).cxx_destruct
{

}

@end
