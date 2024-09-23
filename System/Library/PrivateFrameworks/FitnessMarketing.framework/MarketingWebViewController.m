@implementation MarketingWebViewController

- (_TtC16FitnessMarketing26MarketingWebViewController)initWithBag:(id)a3 account:(id)a4 clientInfo:(id)a5
{
  id v8;
  id v9;

  swift_unknownObjectRetain();
  v8 = a4;
  v9 = a5;
  return (_TtC16FitnessMarketing26MarketingWebViewController *)MarketingWebViewController.init(bag:account:clientInfo:)((uint64_t)a3, a4, a5);
}

- (_TtC16FitnessMarketing26MarketingWebViewController)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_23C1D12B8();
}

- (void)willMoveToParentViewController:(id)a3
{
  id v5;
  _TtC16FitnessMarketing26MarketingWebViewController *v6;

  v5 = a3;
  v6 = self;
  MarketingWebViewController.willMove(toParent:)((UIViewController_optional *)a3);

}

- (void).cxx_destruct
{
  sub_23C1D1048((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC16FitnessMarketing26MarketingWebViewController_coordinator, &OBJC_IVAR____TtC16FitnessMarketing26MarketingWebViewController_onPop);
}

@end
