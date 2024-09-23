@implementation TestMainController

- (void)viewWillAppear:(BOOL)a3
{
  _TtC18SharingViewService18TestMainController *v4;

  v4 = self;
  sub_100014768(a3);

}

- (_TtC18SharingViewService18TestMainController)initWithNibName:(id)a3 bundle:(id)a4
{
  uint64_t v6;
  uint64_t v7;
  id v8;
  NSString v9;
  id v10;
  _TtC18SharingViewService18TestMainController *v11;
  objc_super v13;

  if (a3)
  {
    static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
    v7 = v6;
    *(_QWORD *)&self->super.SBUIRemoteAlertServiceViewController_opaque[OBJC_IVAR____TtC18SharingViewService18TestMainController_vcNav] = 0;
    v8 = a4;
    v9 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(v7);
  }
  else
  {
    *(_QWORD *)&self->super.SBUIRemoteAlertServiceViewController_opaque[OBJC_IVAR____TtC18SharingViewService18TestMainController_vcNav] = 0;
    v10 = a4;
    v9 = 0;
  }
  v13.receiver = self;
  v13.super_class = (Class)type metadata accessor for TestMainController();
  v11 = -[TestMainController initWithNibName:bundle:](&v13, "initWithNibName:bundle:", v9, a4);

  return v11;
}

- (_TtC18SharingViewService18TestMainController)initWithCoder:(id)a3
{
  objc_super v5;

  *(_QWORD *)&self->super.SBUIRemoteAlertServiceViewController_opaque[OBJC_IVAR____TtC18SharingViewService18TestMainController_vcNav] = 0;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for TestMainController();
  return -[TestMainController initWithCoder:](&v5, "initWithCoder:", a3);
}

- (void).cxx_destruct
{

}

@end
