@implementation PurchasesLoadingViewController

- (_TtC22SubscribePageExtension30PurchasesLoadingViewController)initWithCoder:(id)a3
{
  id v4;
  _TtC22SubscribePageExtension30PurchasesLoadingViewController *result;

  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC22SubscribePageExtension30PurchasesLoadingViewController_loggedInUserPurchases) = 0;
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC22SubscribePageExtension30PurchasesLoadingViewController_familyPurchases) = 0;
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC22SubscribePageExtension30PurchasesLoadingViewController_overlayViewController) = 0;
  v4 = a3;

  result = (_TtC22SubscribePageExtension30PurchasesLoadingViewController *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x800000010062E5C0, "SubscribePageExtension/PurchasesLoadingViewController.swift", 59, 2, 55, 0);
  __break(1u);
  return result;
}

- (void)viewDidLoad
{
  _TtC22SubscribePageExtension30PurchasesLoadingViewController *v2;

  v2 = self;
  sub_1005F1FC8();

}

- (unint64_t)supportedInterfaceOrientations
{
  _TtC22SubscribePageExtension30PurchasesLoadingViewController *v2;
  id v3;
  id v4;

  v2 = self;
  v3 = -[PurchasesLoadingViewController traitCollection](v2, "traitCollection");
  v4 = objc_msgSend(v3, "userInterfaceIdiom");

  if (v4 == (id)1)
    return 30;
  else
    return 2;
}

- (void)viewDidLayoutSubviews
{
  _TtC22SubscribePageExtension30PurchasesLoadingViewController *v2;

  v2 = self;
  sub_1005F226C();

}

- (_TtC22SubscribePageExtension30PurchasesLoadingViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4;
  _TtC22SubscribePageExtension30PurchasesLoadingViewController *result;

  v4 = a4;
  result = (_TtC22SubscribePageExtension30PurchasesLoadingViewController *)_swift_stdlib_reportUnimplementedInitializer("SubscribePageExtension.PurchasesLoadingViewController", 53, "init(nibName:bundle:)", 21, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release(*(Class *)((char *)&self->super.super.super.isa
                         + OBJC_IVAR____TtC22SubscribePageExtension30PurchasesLoadingViewController_objectGraph));
  swift_release(*(Class *)((char *)&self->super.super.super.isa
                         + OBJC_IVAR____TtC22SubscribePageExtension30PurchasesLoadingViewController_presenter));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension30PurchasesLoadingViewController_loggedInUserPurchases));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension30PurchasesLoadingViewController_familyPurchases));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension30PurchasesLoadingViewController_overlayViewController));
  swift_release(*(Class *)((char *)&self->super.super.super.isa
                         + OBJC_IVAR____TtC22SubscribePageExtension30PurchasesLoadingViewController_artworkLoader));
}

@end
