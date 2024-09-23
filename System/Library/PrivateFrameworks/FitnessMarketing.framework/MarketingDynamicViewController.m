@implementation MarketingDynamicViewController

- (_TtC16FitnessMarketing30MarketingDynamicViewController)initWithBag:(id)a3 URL:(id)a4
{
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  char *v8;
  uint64_t v10;

  v4 = sub_23C1FB468();
  MEMORY[0x24BDAC7A8](v4);
  v6 = (char *)&v10 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_23C1FB450();
  v7 = swift_unknownObjectRetain();
  v8 = sub_23C1D1080(v7, (uint64_t)v6);
  swift_unknownObjectRelease();
  return (_TtC16FitnessMarketing30MarketingDynamicViewController *)v8;
}

- (_TtC16FitnessMarketing30MarketingDynamicViewController)initWithCoder:(id)a3
{
  sub_23C1D0460((char *)self, (uint64_t)a2, a3, &OBJC_IVAR____TtC16FitnessMarketing30MarketingDynamicViewController_coordinator, &OBJC_IVAR____TtC16FitnessMarketing30MarketingDynamicViewController_onPop);
}

- (void)willMoveToParentViewController:(id)a3
{
  id v5;
  _TtC16FitnessMarketing30MarketingDynamicViewController *v6;

  v5 = a3;
  v6 = self;
  MarketingDynamicViewController.willMove(toParent:)((UIViewController_optional *)a3);

}

- (_TtC16FitnessMarketing30MarketingDynamicViewController)initWithBag:(id)a3 bagValue:(id)a4
{
  sub_23C1D0830((uint64_t)self, (uint64_t)a2, (uint64_t)a3, a4);
}

- (_TtC16FitnessMarketing30MarketingDynamicViewController)initWithBag:(id)a3 javaScriptBagValue:(id)a4
{
  sub_23C1D0830((uint64_t)self, (uint64_t)a2, (uint64_t)a3, a4);
}

- (_TtC16FitnessMarketing30MarketingDynamicViewController)initWithBag:(id)a3 javaScriptURL:(id)a4
{
  sub_23C1D095C();
}

- (_TtC16FitnessMarketing30MarketingDynamicViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4;
  _TtC16FitnessMarketing30MarketingDynamicViewController *result;

  v4 = a4;
  result = (_TtC16FitnessMarketing30MarketingDynamicViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_23C1D1048((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC16FitnessMarketing30MarketingDynamicViewController_coordinator, &OBJC_IVAR____TtC16FitnessMarketing30MarketingDynamicViewController_onPop);
}

@end
