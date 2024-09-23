@implementation RuleResultsViewController

- (_TtC8AppStore25RuleResultsViewController)initWithCoder:(id)a3
{
  id v4;
  _TtC8AppStore25RuleResultsViewController *result;

  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC8AppStore25RuleResultsViewController_textView) = 0;
  v4 = a3;

  result = (_TtC8AppStore25RuleResultsViewController *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x80000001006A63C0, "AppStore/RuleResultsViewController.swift", 40, 2, 27, 0);
  __break(1u);
  return result;
}

- (void)viewDidLoad
{
  _TtC8AppStore25RuleResultsViewController *v2;

  v2 = self;
  sub_1001DBCF4();

}

- (void)viewDidAppear:(BOOL)a3
{
  _TtC8AppStore25RuleResultsViewController *v4;

  v4 = self;
  sub_1001DBE64(a3);

}

- (void)didReceiveMemoryWarning
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)type metadata accessor for RuleResultsViewController();
  -[RuleResultsViewController didReceiveMemoryWarning](&v2, "didReceiveMemoryWarning");
}

- (_TtC8AppStore25RuleResultsViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4;
  _TtC8AppStore25RuleResultsViewController *result;

  v4 = a4;
  result = (_TtC8AppStore25RuleResultsViewController *)_swift_stdlib_reportUnimplementedInitializer("AppStore.RuleResultsViewController", 34, "init(nibName:bundle:)", 21, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release(*(Class *)((char *)&self->super.super.super.isa
                         + OBJC_IVAR____TtC8AppStore25RuleResultsViewController_rule));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.isa
                                     + OBJC_IVAR____TtC8AppStore25RuleResultsViewController_events));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore25RuleResultsViewController_textView));
}

@end
