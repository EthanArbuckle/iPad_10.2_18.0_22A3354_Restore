@implementation LoadingPageViewController

- (_TtC8AppStore25LoadingPageViewController)initWithCoder:(id)a3
{
  id v4;
  _TtC8AppStore25LoadingPageViewController *result;

  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC8AppStore25LoadingPageViewController_contentViewController) = 0;
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC8AppStore25LoadingPageViewController_overlayViewController) = 0;
  *((_BYTE *)&self->super.super.super.isa + OBJC_IVAR____TtC8AppStore25LoadingPageViewController_startedAsFlowPreview) = 0;
  v4 = a3;

  result = (_TtC8AppStore25LoadingPageViewController *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x80000001006A63C0, "AppStore/LoadingPageViewController.swift", 40, 2, 49, 0);
  __break(1u);
  return result;
}

- (void)viewDidLoad
{
  uint64_t v2;
  _TtC8AppStore25LoadingPageViewController *v3;

  v3 = self;
  sub_100220E10((uint64_t)v3, v2);

}

- (void)viewWillLayoutSubviews
{
  uint64_t v2;
  _TtC8AppStore25LoadingPageViewController *v3;

  v3 = self;
  sub_100221014((uint64_t)v3, v2);

}

- (unint64_t)supportedInterfaceOrientations
{
  _TtC8AppStore25LoadingPageViewController *v2;
  id v3;
  id v4;

  v2 = self;
  v3 = -[LoadingPageViewController traitCollection](v2, "traitCollection");
  v4 = objc_msgSend(v3, "userInterfaceIdiom");

  if (v4 == (id)1)
    return 30;
  else
    return 2;
}

- (_TtC8AppStore25LoadingPageViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4;
  _TtC8AppStore25LoadingPageViewController *result;

  v4 = a4;
  result = (_TtC8AppStore25LoadingPageViewController *)_swift_stdlib_reportUnimplementedInitializer("AppStore.LoadingPageViewController", 34, "init(nibName:bundle:)", 21, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release(*(Class *)((char *)&self->super.super.super.isa
                         + OBJC_IVAR____TtC8AppStore25LoadingPageViewController_presenter));
  swift_release(*(Class *)((char *)&self->super.super.super.isa
                         + OBJC_IVAR____TtC8AppStore25LoadingPageViewController_objectGraph));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore25LoadingPageViewController_contentViewController));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore25LoadingPageViewController_overlayViewController));
}

@end
