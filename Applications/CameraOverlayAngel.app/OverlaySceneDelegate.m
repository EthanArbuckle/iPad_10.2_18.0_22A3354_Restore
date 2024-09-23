@implementation OverlaySceneDelegate

- (void)scene:(id)a3 willConnectToSession:(id)a4 options:(id)a5
{
  char **v8;
  id v9;
  id v10;
  _TtC18CameraOverlayAngel20OverlaySceneDelegate *v11;

  v8 = (char **)a3;
  v9 = a4;
  v10 = a5;
  v11 = self;
  sub_10000EE60(v8);

}

- (void)sceneDidDisconnect:(id)a3
{
  id v4;
  _TtC18CameraOverlayAngel20OverlaySceneDelegate *v5;

  v4 = a3;
  v5 = self;
  sub_100009E78(v4);

}

- (void)clientMonitor:(id)a3 didUpdateWithAuditToken:(id)a4
{
  id v6;
  id v7;
  _TtC18CameraOverlayAngel20OverlaySceneDelegate *v8;

  v6 = a3;
  v7 = a4;
  v8 = self;
  sub_10000F3E0(a4);

}

- (void)serverActivatedConnection:(id)a3
{
  id v4;
  _TtC18CameraOverlayAngel20OverlaySceneDelegate *v5;

  v4 = a3;
  v5 = self;
  sub_10000AA6C();

}

- (void)clientConnection:(id)a3 didChangeStatus:(unint64_t)a4
{
  id v5;
  _TtC18CameraOverlayAngel20OverlaySceneDelegate *v6;

  v5 = a3;
  v6 = self;
  sub_10000AA6C();

}

- (void)clientConnectionDidChangeControls:(id)a3
{
  id v4;
  _TtC18CameraOverlayAngel20OverlaySceneDelegate *v5;

  v4 = a3;
  v5 = self;
  sub_10000B178();

}

- (void)clientConnection:(id)a3 didApplyControlUpdate:(id)a4
{
  objc_msgSend(*(id *)((char *)&self->super.super.isa + OBJC_IVAR____TtC18CameraOverlayAngel20OverlaySceneDelegate_overlayController), "applyControlUpdate:", a4);
}

- (void)systemOverlayViewController:(id)a3 didChangeSliderVisible:(BOOL)a4
{
  id v6;
  _TtC18CameraOverlayAngel20OverlaySceneDelegate *v7;

  v6 = a3;
  v7 = self;
  sub_10000BF74(v6, a4);

}

- (void)systemOverlayViewController:(id)a3 didUpdateControl:(id)a4
{
  id v6;
  id v7;
  _TtC18CameraOverlayAngel20OverlaySceneDelegate *v8;

  v6 = a3;
  v7 = a4;
  v8 = self;
  sub_10000C114(v6, v7);

}

- (void)systemOverlayViewController:(id)a3 menuDidScrollToControlAtIndex:(int64_t)a4
{
  id v5;
  _TtC18CameraOverlayAngel20OverlaySceneDelegate *v6;

  v5 = a3;
  v6 = self;
  sub_10000F8F8();

}

- (void)systemOverlayViewController:(id)a3 didChangeActiveControl:(id)a4
{
  id v6;
  id v7;
  _TtC18CameraOverlayAngel20OverlaySceneDelegate *v8;

  v6 = a3;
  v7 = a4;
  v8 = self;
  sub_10000F95C(v7);

}

- (void)systemOverlayViewControllerWillHideSlider:(id)a3
{
  id v4;
  _TtC18CameraOverlayAngel20OverlaySceneDelegate *v5;

  v4 = a3;
  v5 = self;
  sub_10000FA34();

}

- (void)systemOverlayViewControllerCancelledHidingSlider:(id)a3
{
  uint64_t v4;
  void *v5;
  id v6;
  _TtC18CameraOverlayAngel20OverlaySceneDelegate *v7;
  id v8;

  v4 = OBJC_IVAR____TtC18CameraOverlayAngel20OverlaySceneDelegate_quietUIEndTimer;
  v5 = *(Class *)((char *)&self->super.super.isa
                + OBJC_IVAR____TtC18CameraOverlayAngel20OverlaySceneDelegate_quietUIEndTimer);
  v6 = a3;
  v7 = self;
  objc_msgSend(v5, "invalidate");
  v8 = *(Class *)((char *)&self->super.super.isa + v4);
  *(Class *)((char *)&self->super.super.isa + v4) = 0;

}

- (void)touchUpOccuredForIdentifier:(unsigned int)a3 detached:(BOOL)a4 context:(unsigned int)a5 pid:(int)a6
{
  _TtC18CameraOverlayAngel20OverlaySceneDelegate *v7;

  v7 = self;
  sub_10000FC78(a6);

}

- (_TtC18CameraOverlayAngel20OverlaySceneDelegate)init
{
  return (_TtC18CameraOverlayAngel20OverlaySceneDelegate *)sub_10000CDD4();
}

- (void).cxx_destruct
{

  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC18CameraOverlayAngel20OverlaySceneDelegate_overlayController));
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC18CameraOverlayAngel20OverlaySceneDelegate_clientMonitor));
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC18CameraOverlayAngel20OverlaySceneDelegate_figCameraViewfinder));
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC18CameraOverlayAngel20OverlaySceneDelegate_sceneTeardownTimer));
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC18CameraOverlayAngel20OverlaySceneDelegate_clientAuditToken));
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC18CameraOverlayAngel20OverlaySceneDelegate_connection));
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC18CameraOverlayAngel20OverlaySceneDelegate_lastUsedControl));
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC18CameraOverlayAngel20OverlaySceneDelegate_quietUITimer));
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC18CameraOverlayAngel20OverlaySceneDelegate_quietUIEndTimer));
}

- (void)cameraViewfinder:(id)a3 viewfinderSessionDidBegin:(id)a4
{
  id v6;
  id v7;
  _TtC18CameraOverlayAngel20OverlaySceneDelegate *v8;

  v6 = a3;
  v7 = a4;
  v8 = self;
  sub_10000FE78(a4, "SceneDelegate: Client %{public}d session began", "SceneDelegate: Ignoring session began for %{public}d");

}

- (void)cameraViewfinder:(id)a3 viewfinderSessionDidEnd:(id)a4
{
  id v6;
  id v7;
  _TtC18CameraOverlayAngel20OverlaySceneDelegate *v8;

  v6 = a3;
  v7 = a4;
  v8 = self;
  sub_10000FE78(a4, "SceneDelegate: Client %{public}d session ended", "SceneDelegate: Ignoring session ended for %{public}d");

}

- (void)cameraViewfinderSessionDidStartMovieRecording:(id)a3
{
  id v5;
  _TtC18CameraOverlayAngel20OverlaySceneDelegate *v6;

  v5 = a3;
  v6 = self;
  sub_10000D158(a3, "SceneDelegate: Client %{public}d began recording", 1, "SceneDelegate: Ignoring recording began for %{public}d");

}

- (void)cameraViewfinderSessionDidFinishMovieRecording:(id)a3
{
  id v5;
  _TtC18CameraOverlayAngel20OverlaySceneDelegate *v6;

  v5 = a3;
  v6 = self;
  sub_10000D158(a3, "SceneDelegate: Client %{public}d) finished recording", 0, "SceneDelegate: Ignoring recording finished for %{public}d");

}

@end
