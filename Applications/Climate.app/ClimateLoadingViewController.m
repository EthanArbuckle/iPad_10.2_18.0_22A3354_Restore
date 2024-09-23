@implementation ClimateLoadingViewController

- (_TtC7Climate28ClimateLoadingViewController)init
{
  _TtC7Climate28ClimateLoadingViewController *v2;
  _TtC7Climate28ClimateLoadingViewController *result;
  _TtC7Climate28ClimateLoadingViewController *v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for ClimateLoadingViewController();
  v2 = -[ClimateLoadingViewController initWithNibName:bundle:](&v6, "initWithNibName:bundle:", 0, 0);
  result = (_TtC7Climate28ClimateLoadingViewController *)-[ClimateLoadingViewController view](v2, "view");
  if (result)
  {
    v4 = result;
    sub_100006B04(0, (unint64_t *)&qword_1000B91A0, UIColor_ptr);
    v5 = (void *)static UIColor.cafui_tableBackground.getter();
    -[ClimateLoadingViewController setBackgroundColor:](v4, "setBackgroundColor:", v5);

    return v2;
  }
  else
  {
    __break(1u);
  }
  return result;
}

- (_TtC7Climate28ClimateLoadingViewController)initWithCoder:(id)a3
{
  _TtC7Climate28ClimateLoadingViewController *result;

  result = (_TtC7Climate28ClimateLoadingViewController *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x800000010008BA30, "Climate/ClimateLoadingViewController.swift", 42, 2, 21, 0);
  __break(1u);
  return result;
}

- (_TtC7Climate28ClimateLoadingViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4;
  _TtC7Climate28ClimateLoadingViewController *result;

  v4 = a4;
  result = (_TtC7Climate28ClimateLoadingViewController *)_swift_stdlib_reportUnimplementedInitializer("Climate.ClimateLoadingViewController", 36, "init(nibName:bundle:)", 21, 0);
  __break(1u);
  return result;
}

- (void)viewDidLoad
{
  _TtC7Climate28ClimateLoadingViewController *v2;

  v2 = self;
  sub_10000D2F8();

}

@end
