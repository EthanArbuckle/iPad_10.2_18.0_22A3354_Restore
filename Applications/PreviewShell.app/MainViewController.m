@implementation MainViewController

- (_TtC12PreviewShell18MainViewController)init
{
  return (_TtC12PreviewShell18MainViewController *)sub_100020008();
}

- (_TtC12PreviewShell18MainViewController)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_100022C9C();
}

- (void)viewDidLoad
{
  _BYTE *v2;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)swift_getObjectType(self);
  v2 = v3.receiver;
  -[MainViewController viewDidLoad](&v3, "viewDidLoad");
  sub_10001FCC4(v2[OBJC_IVAR____TtC12PreviewShell18MainViewController_state], 0);

}

- (void)viewDidLayoutSubviews
{
  _TtC12PreviewShell18MainViewController *v2;

  v2 = self;
  sub_1000212BC();

}

- (unint64_t)supportedInterfaceOrientations
{
  void *v2;

  v2 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC12PreviewShell18MainViewController_visibleChild);
  if (v2)
    return (unint64_t)objc_msgSend(v2, "supportedInterfaceOrientations");
  else
    return 30;
}

- (_TtC12PreviewShell18MainViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4;
  _TtC12PreviewShell18MainViewController *result;

  v4 = a4;
  result = (_TtC12PreviewShell18MainViewController *)_swift_stdlib_reportUnimplementedInitializer("PreviewShell.MainViewController", 31, "init(nibName:bundle:)", 21, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release(*(Class *)((char *)&self->super.super.super.isa
                         + OBJC_IVAR____TtC12PreviewShell18MainViewController_invalidationHandle));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC12PreviewShell18MainViewController_visibleChild));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC12PreviewShell18MainViewController_splashViewController));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC12PreviewShell18MainViewController_connectViewController));
  sub_100022F80((uint64_t)self + OBJC_IVAR____TtC12PreviewShell18MainViewController_canvasObserver);
  swift_release(*(Class *)((char *)&self->super.super.super.isa
                         + OBJC_IVAR____TtC12PreviewShell18MainViewController_xcodeObservation));
  sub_100022F80((uint64_t)self + OBJC_IVAR____TtC12PreviewShell18MainViewController_previewCacheObserver);
  swift_release(*(Class *)((char *)&self->super.super.super.isa
                         + OBJC_IVAR____TtC12PreviewShell18MainViewController_xcodeConnectionWaitTimer));
  swift_release(*(Class *)((char *)&self->super.super.super.isa
                         + OBJC_IVAR____TtC12PreviewShell18MainViewController_previewCanvas));
}

@end
