@implementation MarketingItemViewController

- (_TtC16FitnessMarketing27MarketingItemViewController)initWithServiceType:(id)a3 placement:(id)a4 bag:(id)a5
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v6 = sub_23C1FBCCC();
  v8 = v7;
  v9 = sub_23C1FBCCC();
  v11 = v10;
  swift_unknownObjectRetain();
  return (_TtC16FitnessMarketing27MarketingItemViewController *)MarketingItemViewController.init(serviceType:placement:bag:)(v6, v8, v9, v11, (uint64_t)a5);
}

- (_TtC16FitnessMarketing27MarketingItemViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v8;

  if (a3)
  {
    v5 = sub_23C1FBCCC();
    v7 = v6;
  }
  else
  {
    v5 = 0;
    v7 = 0;
  }
  v8 = a4;
  return (_TtC16FitnessMarketing27MarketingItemViewController *)MarketingItemViewController.init(nibName:bundle:)(v5, v7, a4);
}

- (_TtC16FitnessMarketing27MarketingItemViewController)initWithCoder:(id)a3
{
  sub_23C1D0460((char *)self, (uint64_t)a2, a3, &OBJC_IVAR____TtC16FitnessMarketing27MarketingItemViewController_coordinator, &OBJC_IVAR____TtC16FitnessMarketing27MarketingItemViewController_onPop);
}

- (void)willMoveToParentViewController:(id)a3
{
  id v5;
  _TtC16FitnessMarketing27MarketingItemViewController *v6;

  v5 = a3;
  v6 = self;
  MarketingItemViewController.willMove(toParent:)((UIViewController_optional *)a3);

}

- (_TtC16FitnessMarketing27MarketingItemViewController)initWithMarketingItem:(id)a3 bag:(id)a4
{
  id v4;
  _TtC16FitnessMarketing27MarketingItemViewController *result;

  v4 = a3;
  swift_unknownObjectRetain();
  result = (_TtC16FitnessMarketing27MarketingItemViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (_TtC16FitnessMarketing27MarketingItemViewController)initWithServiceType:(id)a3 placement:(id)a4 account:(id)a5 bag:(id)a6
{
  id v6;
  _TtC16FitnessMarketing27MarketingItemViewController *result;

  v6 = a5;
  swift_unknownObjectRetain();
  result = (_TtC16FitnessMarketing27MarketingItemViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (_TtC16FitnessMarketing27MarketingItemViewController)initWithBag:(id)a3 bagValue:(id)a4
{
  sub_23C1D0830((uint64_t)self, (uint64_t)a2, (uint64_t)a3, a4);
}

- (_TtC16FitnessMarketing27MarketingItemViewController)initWithBag:(id)a3 URL:(id)a4
{
  sub_23C1D095C();
}

- (void).cxx_destruct
{
  sub_23C1D1048((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC16FitnessMarketing27MarketingItemViewController_coordinator, &OBJC_IVAR____TtC16FitnessMarketing27MarketingItemViewController_onPop);
}

@end
