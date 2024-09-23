@implementation LoadingPageViewController

- (_TtC20ProductPageExtension25LoadingPageViewController)initWithCoder:(id)a3
{
  id v4;
  _TtC20ProductPageExtension25LoadingPageViewController *result;

  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC20ProductPageExtension25LoadingPageViewController_contentViewController) = 0;
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC20ProductPageExtension25LoadingPageViewController_overlayViewController) = 0;
  *((_BYTE *)&self->super.super.super.isa
  + OBJC_IVAR____TtC20ProductPageExtension25LoadingPageViewController_startedAsFlowPreview) = 0;
  v4 = a3;

  result = (_TtC20ProductPageExtension25LoadingPageViewController *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x8000000100685560, "ProductPageExtension/LoadingPageViewController.swift", 52, 2, 49, 0);
  __break(1u);
  return result;
}

- (void)viewDidLoad
{
  _TtC20ProductPageExtension25LoadingPageViewController *v2;

  v2 = self;
  sub_100580418();

}

- (void)viewWillLayoutSubviews
{
  _TtC20ProductPageExtension25LoadingPageViewController *v2;

  v2 = self;
  sub_10058061C();

}

- (unint64_t)supportedInterfaceOrientations
{
  _TtC20ProductPageExtension25LoadingPageViewController *v2;
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

- (_TtC20ProductPageExtension25LoadingPageViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4;
  _TtC20ProductPageExtension25LoadingPageViewController *result;

  v4 = a4;
  result = (_TtC20ProductPageExtension25LoadingPageViewController *)_swift_stdlib_reportUnimplementedInitializer("ProductPageExtension.LoadingPageViewController", 46, "init(nibName:bundle:)", 21, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release(*(Class *)((char *)&self->super.super.super.isa
                         + OBJC_IVAR____TtC20ProductPageExtension25LoadingPageViewController_presenter));
  swift_release(*(Class *)((char *)&self->super.super.super.isa
                         + OBJC_IVAR____TtC20ProductPageExtension25LoadingPageViewController_objectGraph));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension25LoadingPageViewController_contentViewController));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension25LoadingPageViewController_overlayViewController));
}

@end
