@implementation RemoteContentViewController

- (_TtC12PreviewShell27RemoteContentViewController)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_10001423C();
}

- (void)viewDidLoad
{
  _TtC12PreviewShell27RemoteContentViewController *v2;

  v2 = self;
  sub_100012B6C();

}

- (void)viewDidLayoutSubviews
{
  _TtC12PreviewShell27RemoteContentViewController *v2;

  v2 = self;
  sub_100012E48();

}

- (_TtC12PreviewShell27RemoteContentViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4;
  _TtC12PreviewShell27RemoteContentViewController *result;

  v4 = a4;
  result = (_TtC12PreviewShell27RemoteContentViewController *)_swift_stdlib_reportUnimplementedInitializer("PreviewShell.RemoteContentViewController", 40, "init(nibName:bundle:)", 21, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;

  swift_unknownObjectRelease(*(Class *)((char *)&self->super.super.super.isa
                                      + OBJC_IVAR____TtC12PreviewShell27RemoteContentViewController_scenePresenter));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC12PreviewShell27RemoteContentViewController_snapshotView));
  v3 = (char *)self + OBJC_IVAR____TtC12PreviewShell27RemoteContentViewController_stoppedStyle;
  v4 = type metadata accessor for SceneStoppedStyle(0);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC12PreviewShell27RemoteContentViewController_stoppedViewController));
  v5 = (char *)self + OBJC_IVAR____TtC12PreviewShell27RemoteContentViewController_crashedStyle;
  v6 = type metadata accessor for SceneCrashedStyle(0);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v6 - 8) + 8))(v5, v6);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC12PreviewShell27RemoteContentViewController_crashedViewController));
  swift_release(*(Class *)((char *)&self->super.super.super.isa
                         + OBJC_IVAR____TtC12PreviewShell27RemoteContentViewController_cacheSnapshotTimer));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC12PreviewShell27RemoteContentViewController_cachedSnapshotCGImage));
}

@end
