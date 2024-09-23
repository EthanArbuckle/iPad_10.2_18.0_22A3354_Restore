@implementation DebugRecordReplayViewController

- (_TtC11AssetViewer31DebugRecordReplayViewController)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1D9462FB4();
}

- (void)viewDidLoad
{
  _TtC11AssetViewer31DebugRecordReplayViewController *v2;

  v2 = self;
  sub_1D945C104();

}

- (void)helpDismissVC
{
  _TtC11AssetViewer31DebugRecordReplayViewController *v2;

  v2 = self;
  sub_1D945D414();

}

- (void)tappedWithRecognizer:(id)a3
{
  id v4;
  _TtC11AssetViewer31DebugRecordReplayViewController *v5;

  v4 = a3;
  v5 = self;
  sub_1D945DC80(v4);

}

- (void)recordButtonPressed
{
  _TtC11AssetViewer31DebugRecordReplayViewController *v2;
  _TtC11AssetViewer31DebugRecordReplayViewController *v3;

  if (*((_BYTE *)&self->super.super.super.isa + OBJC_IVAR____TtC11AssetViewer31DebugRecordReplayViewController_state))
  {
    if (*((_BYTE *)&self->super.super.super.isa + OBJC_IVAR____TtC11AssetViewer31DebugRecordReplayViewController_state) == 1)
    {
      v2 = self;
      sub_1D945FAF4();

    }
  }
  else
  {
    v3 = self;
    sub_1D945F3B4();

  }
}

- (void)playButtonPressed
{
  _TtC11AssetViewer31DebugRecordReplayViewController *v2;

  if (!*((_BYTE *)&self->super.super.super.isa + OBJC_IVAR____TtC11AssetViewer31DebugRecordReplayViewController_state))
  {
    v2 = self;
    sub_1D946065C();

  }
}

- (void)resetButtonPressed
{
  _TtC11AssetViewer31DebugRecordReplayViewController *v2;

  v2 = self;
  sub_1D945DF74();

}

- (void)blinkButtonPressed
{
  _TtC11AssetViewer31DebugRecordReplayViewController *v2;

  v2 = self;
  sub_1D945E2C8();

}

- (_TtC11AssetViewer31DebugRecordReplayViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4;
  _TtC11AssetViewer31DebugRecordReplayViewController *result;

  v4 = a4;
  result = (_TtC11AssetViewer31DebugRecordReplayViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;

  swift_unknownObjectWeakDestroy();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11AssetViewer31DebugRecordReplayViewController_arqlVC));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11AssetViewer31DebugRecordReplayViewController_overlayView));
  swift_bridgeObjectRelease();
  swift_unknownObjectWeakDestroy();
  swift_bridgeObjectRelease();
  sub_1D93D2000((uint64_t)self + OBJC_IVAR____TtC11AssetViewer31DebugRecordReplayViewController_modelURL, &qword_1F01C5DB0);
  v3 = (char *)self + OBJC_IVAR____TtC11AssetViewer31DebugRecordReplayViewController_arRecordingURL;
  v4 = sub_1D94D1204();
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11AssetViewer31DebugRecordReplayViewController_blinkTimer));
  v5 = (char *)self + OBJC_IVAR____TtC11AssetViewer31DebugRecordReplayViewController_optionsToBlink;
  v6 = sub_1D94D2020();
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v6 - 8) + 8))(v5, v6);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11AssetViewer31DebugRecordReplayViewController____lazy_storage___replayObserver));
}

- (void)session:(id)a3 didUpdateFrame:(id)a4
{
  id v6;
  id v7;
  _TtC11AssetViewer31DebugRecordReplayViewController *v8;

  v6 = a3;
  v7 = a4;
  v8 = self;
  DebugRecordReplayViewController.session(_:didUpdate:)((ARSession)v6, (ARFrame)v7);

}

- (void)session:(id)a3 cameraDidChangeTrackingState:(id)a4
{
  void *v4;
  id v7;
  id v8;
  _TtC11AssetViewer31DebugRecordReplayViewController *v9;
  id v10;

  v4 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC11AssetViewer31DebugRecordReplayViewController_arqlVC);
  if (v4)
  {
    v7 = a3;
    v8 = a4;
    v9 = self;
    v10 = v4;
    sub_1D9478CD4(v8);

  }
}

- (void)sessionWasInterrupted:(id)a3
{
  sub_1D9460F80((char *)self, (uint64_t)a2, a3, (void (*)(void))sub_1D9478ED4);
}

- (void)sessionInterruptionEnded:(id)a3
{
  sub_1D9460F80((char *)self, (uint64_t)a2, a3, (void (*)(void))sub_1D9478EF0);
}

- (void)session:(id)a3 didUpdateAnchors:(id)a4
{
  sub_1D946103C((char *)self, (uint64_t)a2, a3, (uint64_t)a4, (void (*)(id, uint64_t))PreviewViewController.session(_:didUpdate:));
}

- (void)session:(id)a3 didAddAnchors:(id)a4
{
  sub_1D946103C((char *)self, (uint64_t)a2, a3, (uint64_t)a4, (void (*)(id, uint64_t))PreviewViewController.session(_:didAdd:));
}

- (void)session:(id)a3 didRemoveAnchors:(id)a4
{
  sub_1D946103C((char *)self, (uint64_t)a2, a3, (uint64_t)a4, (void (*)(id, uint64_t))PreviewViewController.session(_:didRemove:));
}

@end
