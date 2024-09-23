@implementation EnhancedLoggingDiagnosticInfoViewController

- (void)viewWillAppear:(BOOL)a3
{
  _TtC11Diagnostics43EnhancedLoggingDiagnosticInfoViewController *v4;

  v4 = self;
  sub_100052E58(a3);

}

- (_TtC11Diagnostics43EnhancedLoggingDiagnosticInfoViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  uint64_t v5;
  DARootViewController *v6;
  DARootViewController *v7;
  id v8;

  if (a3)
  {
    v5 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
    v7 = v6;
  }
  else
  {
    v5 = 0;
    v7 = 0;
  }
  v8 = a4;
  return (_TtC11Diagnostics43EnhancedLoggingDiagnosticInfoViewController *)sub_1000537D4(v5, v7, a4);
}

- (_TtC11Diagnostics43EnhancedLoggingDiagnosticInfoViewController)initWithCoder:(id)a3
{
  return (_TtC11Diagnostics43EnhancedLoggingDiagnosticInfoViewController *)sub_100053964(a3);
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease(*(_QWORD *)&self->logType[OBJC_IVAR____TtC11Diagnostics43EnhancedLoggingDiagnosticInfoViewController_logType]);
  swift_bridgeObjectRelease(*(_QWORD *)&self->logType[OBJC_IVAR____TtC11Diagnostics43EnhancedLoggingDiagnosticInfoViewController_logName]);
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC11Diagnostics43EnhancedLoggingDiagnosticInfoViewController_descriptionTextView));
}

@end
