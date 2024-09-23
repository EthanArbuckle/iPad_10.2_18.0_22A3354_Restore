@implementation SelfServiceSuiteInProgressViewController

- (void)viewDidLoad
{
  char *v2;
  id v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for SelfServiceSuiteInProgressViewController();
  v2 = (char *)v4.receiver;
  -[SelfServiceSuiteInProgressViewController viewDidLoad](&v4, "viewDidLoad");
  sub_10008FAE4();
  v3 = objc_msgSend(v2, "contentView", v4.receiver, v4.super_class);
  objc_msgSend(v3, "addSubview:", *(_QWORD *)&v2[OBJC_IVAR____TtC11Diagnostics40SelfServiceSuiteInProgressViewController_progressView]);

  sub_100090084();
}

- (void)viewDidAppear:(BOOL)a3
{
  _TtC11Diagnostics40SelfServiceSuiteInProgressViewController *v4;

  v4 = self;
  sub_1000905B8(a3);

}

- (_TtC11Diagnostics40SelfServiceSuiteInProgressViewController)initWithTitle:(id)a3 detailText:(id)a4 symbolName:(id)a5 contentLayout:(int64_t)a6
{
  _TtC11Diagnostics40SelfServiceSuiteInProgressViewController *result;

  result = (_TtC11Diagnostics40SelfServiceSuiteInProgressViewController *)_swift_stdlib_reportUnimplementedInitializer("Diagnostics.SelfServiceSuiteInProgressViewController", 52, "init(title:detailText:symbolName:contentLayout:)", 48, 0);
  __break(1u);
  return result;
}

- (_TtC11Diagnostics40SelfServiceSuiteInProgressViewController)initWithTitle:(id)a3 detailText:(id)a4 icon:(id)a5 contentLayout:(int64_t)a6
{
  id v6;
  _TtC11Diagnostics40SelfServiceSuiteInProgressViewController *result;

  v6 = a5;
  result = (_TtC11Diagnostics40SelfServiceSuiteInProgressViewController *)_swift_stdlib_reportUnimplementedInitializer("Diagnostics.SelfServiceSuiteInProgressViewController", 52, "init(title:detailText:icon:contentLayout:)", 42, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{

  sub_100035D74(*(_QWORD *)&self->OBWelcomeController_opaque[OBJC_IVAR____TtC11Diagnostics40SelfServiceSuiteInProgressViewController_onAppear], *(_QWORD *)&self->progressViewHorizontalPadding[OBJC_IVAR____TtC11Diagnostics40SelfServiceSuiteInProgressViewController_onAppear]);
}

@end
