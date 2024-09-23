@implementation SimulatorMainSceneDelegate

- (UIWindow)window
{
  return (UIWindow *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                             + OBJC_IVAR____TtC12PreviewShell26SimulatorMainSceneDelegate_window));
}

- (void)setWindow:(id)a3
{
  id v3;
  id v4;

  v4 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC12PreviewShell26SimulatorMainSceneDelegate_window);
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC12PreviewShell26SimulatorMainSceneDelegate_window) = (Class)a3;
  v3 = a3;

}

- (_TtC12PreviewShell26SimulatorMainSceneDelegate)init
{
  return (_TtC12PreviewShell26SimulatorMainSceneDelegate *)sub_1000352E0((char *)self, (uint64_t)a2, &OBJC_IVAR____TtC12PreviewShell26SimulatorMainSceneDelegate_window, &OBJC_IVAR____TtC12PreviewShell26SimulatorMainSceneDelegate_previewShellScene);
}

- (void).cxx_destruct
{
  sub_100035394((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC12PreviewShell26SimulatorMainSceneDelegate_window, &OBJC_IVAR____TtC12PreviewShell26SimulatorMainSceneDelegate_previewShellScene);
}

@end
