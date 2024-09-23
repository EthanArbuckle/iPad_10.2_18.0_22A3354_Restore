@implementation RuleResultsViewController

- (_TtC22SubscribePageExtension25RuleResultsViewController)initWithCoder:(id)a3
{
  id v4;
  _TtC22SubscribePageExtension25RuleResultsViewController *result;

  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC22SubscribePageExtension25RuleResultsViewController_textView) = 0;
  v4 = a3;

  result = (_TtC22SubscribePageExtension25RuleResultsViewController *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x800000010062E5C0, "SubscribePageExtension/RuleResultsViewController.swift", 54, 2, 27, 0);
  __break(1u);
  return result;
}

- (void)viewDidLoad
{
  _TtC22SubscribePageExtension25RuleResultsViewController *v2;

  v2 = self;
  sub_1002A7AEC();

}

- (void)viewDidAppear:(BOOL)a3
{
  _TtC22SubscribePageExtension25RuleResultsViewController *v4;

  v4 = self;
  sub_1002A7C5C(a3);

}

- (void)didReceiveMemoryWarning
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)type metadata accessor for RuleResultsViewController();
  -[RuleResultsViewController didReceiveMemoryWarning](&v2, "didReceiveMemoryWarning");
}

- (_TtC22SubscribePageExtension25RuleResultsViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4;
  _TtC22SubscribePageExtension25RuleResultsViewController *result;

  v4 = a4;
  result = (_TtC22SubscribePageExtension25RuleResultsViewController *)_swift_stdlib_reportUnimplementedInitializer("SubscribePageExtension.RuleResultsViewController", 48, "init(nibName:bundle:)", 21, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release(*(Class *)((char *)&self->super.super.super.isa
                         + OBJC_IVAR____TtC22SubscribePageExtension25RuleResultsViewController_rule));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.isa
                                     + OBJC_IVAR____TtC22SubscribePageExtension25RuleResultsViewController_events));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension25RuleResultsViewController_textView));
}

@end
