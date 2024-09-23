@implementation LoadingPageViewController

- (_TtC22SubscribePageExtension25LoadingPageViewController)initWithCoder:(id)a3
{
  id v4;
  _TtC22SubscribePageExtension25LoadingPageViewController *result;

  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC22SubscribePageExtension25LoadingPageViewController_contentViewController) = 0;
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC22SubscribePageExtension25LoadingPageViewController_overlayViewController) = 0;
  *((_BYTE *)&self->super.super.super.isa
  + OBJC_IVAR____TtC22SubscribePageExtension25LoadingPageViewController_startedAsFlowPreview) = 0;
  v4 = a3;

  result = (_TtC22SubscribePageExtension25LoadingPageViewController *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x800000010062E5C0, "SubscribePageExtension/LoadingPageViewController.swift", 54, 2, 49, 0);
  __break(1u);
  return result;
}

- (void)viewDidLoad
{
  _TtC22SubscribePageExtension25LoadingPageViewController *v2;

  v2 = self;
  sub_1004E28EC();

}

- (void)viewWillLayoutSubviews
{
  _TtC22SubscribePageExtension25LoadingPageViewController *v2;

  v2 = self;
  sub_1004E2AF0();

}

- (unint64_t)supportedInterfaceOrientations
{
  _TtC22SubscribePageExtension25LoadingPageViewController *v2;
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

- (_TtC22SubscribePageExtension25LoadingPageViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4;
  _TtC22SubscribePageExtension25LoadingPageViewController *result;

  v4 = a4;
  result = (_TtC22SubscribePageExtension25LoadingPageViewController *)_swift_stdlib_reportUnimplementedInitializer("SubscribePageExtension.LoadingPageViewController", 48, "init(nibName:bundle:)", 21, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release(*(Class *)((char *)&self->super.super.super.isa
                         + OBJC_IVAR____TtC22SubscribePageExtension25LoadingPageViewController_presenter));
  swift_release(*(Class *)((char *)&self->super.super.super.isa
                         + OBJC_IVAR____TtC22SubscribePageExtension25LoadingPageViewController_objectGraph));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension25LoadingPageViewController_contentViewController));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension25LoadingPageViewController_overlayViewController));
}

@end
