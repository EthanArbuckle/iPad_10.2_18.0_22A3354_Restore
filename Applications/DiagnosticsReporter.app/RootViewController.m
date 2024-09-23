@implementation RootViewController

- (void)viewDidAppear:(BOOL)a3
{
  _TtC19DiagnosticsReporter18RootViewController *v3;

  v3 = self;
  sub_1000080D4();

}

- (_TtC19DiagnosticsReporter18RootViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  objc_class *ObjectType;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  id v11;
  char *v12;
  id v13;
  _TtC19DiagnosticsReporter18RootViewController *v14;
  objc_super v16;

  ObjectType = (objc_class *)swift_getObjectType(self, a2);
  if (a3)
  {
    static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
    v9 = v8;
    v10 = (char *)self + OBJC_IVAR____TtC19DiagnosticsReporter18RootViewController_diagnosticLog;
    *(_OWORD *)v10 = 0u;
    *((_OWORD *)v10 + 1) = 0u;
    *((_QWORD *)v10 + 4) = 0;
    *(Class *)((char *)&self->super.super.super.isa
             + OBJC_IVAR____TtC19DiagnosticsReporter18RootViewController_feedbackController) = 0;
    v11 = a4;
    a3 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(v9);
  }
  else
  {
    v12 = (char *)self + OBJC_IVAR____TtC19DiagnosticsReporter18RootViewController_diagnosticLog;
    *(_OWORD *)v12 = 0u;
    *((_OWORD *)v12 + 1) = 0u;
    *((_QWORD *)v12 + 4) = 0;
    *(Class *)((char *)&self->super.super.super.isa
             + OBJC_IVAR____TtC19DiagnosticsReporter18RootViewController_feedbackController) = 0;
    v13 = a4;
  }
  v16.receiver = self;
  v16.super_class = ObjectType;
  v14 = -[RootViewController initWithNibName:bundle:](&v16, "initWithNibName:bundle:", a3, a4);

  return v14;
}

- (_TtC19DiagnosticsReporter18RootViewController)initWithCoder:(id)a3
{
  objc_class *ObjectType;
  char *v6;
  objc_super v8;

  ObjectType = (objc_class *)swift_getObjectType(self, a2);
  v6 = (char *)self + OBJC_IVAR____TtC19DiagnosticsReporter18RootViewController_diagnosticLog;
  *(_OWORD *)v6 = 0u;
  *((_OWORD *)v6 + 1) = 0u;
  *((_QWORD *)v6 + 4) = 0;
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC19DiagnosticsReporter18RootViewController_feedbackController) = 0;
  v8.receiver = self;
  v8.super_class = ObjectType;
  return -[RootViewController initWithCoder:](&v8, "initWithCoder:", a3);
}

- (void).cxx_destruct
{
  sub_100003398((uint64_t)self + OBJC_IVAR____TtC19DiagnosticsReporter18RootViewController_diagnosticLog);
  swift_release(*(Class *)((char *)&self->super.super.super.isa
                         + OBJC_IVAR____TtC19DiagnosticsReporter18RootViewController_feedbackController));
}

@end
