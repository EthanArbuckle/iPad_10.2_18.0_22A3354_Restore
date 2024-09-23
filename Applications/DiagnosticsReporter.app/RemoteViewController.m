@implementation RemoteViewController

- (void)viewDidAppear:(BOOL)a3
{
  _TtC19DiagnosticsReporter20RemoteViewController *v3;

  v3 = self;
  sub_100009D80();

}

- (void)viewWillDisappear:(BOOL)a3
{
  sub_100009ED0(0xD000000000000015, 0x800000010000FF40);
}

- (unint64_t)supportedInterfaceOrientations
{
  return 30;
}

- (void)didInvalidateForRemoteAlert
{
  sub_100009ED0(0xD00000000000001DLL, 0x800000010000FF20);
}

- (void)prepareForActivationWithContext:(id)a3 completion:(id)a4
{
  void (*v6)(void);
  uint64_t v7;
  id v8;
  _TtC19DiagnosticsReporter20RemoteViewController *v9;

  v6 = (void (*)(void))_Block_copy(a4);
  if (v6)
  {
    v7 = swift_allocObject(&unk_100014C30, 24, 7);
    *(_QWORD *)(v7 + 16) = v6;
    v6 = (void (*)(void))sub_10000A404;
  }
  else
  {
    v7 = 0;
  }
  v8 = a3;
  v9 = self;
  sub_10000A05C(v6);
  sub_10000A378((uint64_t)v6, v7);

}

- (void)configureWithContext:(id)a3 completion:(id)a4
{
  void (*v6)(uint64_t);
  uint64_t v7;
  id v8;
  _TtC19DiagnosticsReporter20RemoteViewController *v9;

  v6 = (void (*)(uint64_t))_Block_copy(a4);
  if (v6)
  {
    v7 = swift_allocObject(&unk_100014C08, 24, 7);
    *(_QWORD *)(v7 + 16) = v6;
    v6 = (void (*)(uint64_t))sub_10000A404;
  }
  else
  {
    v7 = 0;
  }
  v8 = a3;
  v9 = self;
  sub_100008E40(a3, v6);
  sub_10000A378((uint64_t)v6, v7);

}

- (void)dismissViewControllerAnimated:(BOOL)a3 completion:(id)a4
{
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t (*v8)();
  _TtC19DiagnosticsReporter20RemoteViewController *v9;

  v5 = _Block_copy(a4);
  if (v5)
  {
    v6 = v5;
    v7 = swift_allocObject(&unk_100014BE0, 24, 7);
    *(_QWORD *)(v7 + 16) = v6;
    v8 = sub_10000A3AC;
  }
  else
  {
    v8 = 0;
    v7 = 0;
  }
  v9 = self;
  sub_10000A1E0();
  sub_10000A378((uint64_t)v8, v7);

}

- (_TtC19DiagnosticsReporter20RemoteViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  uint64_t v6;
  uint64_t v7;
  unsigned __int8 *v8;
  id v9;
  NSString v10;
  unsigned __int8 *v11;
  id v12;
  _TtC19DiagnosticsReporter20RemoteViewController *v13;
  objc_super v15;

  if (a3)
  {
    static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
    v7 = v6;
    v8 = &self->SBUIRemoteAlertServiceViewController_opaque[OBJC_IVAR____TtC19DiagnosticsReporter20RemoteViewController_diagnosticsLog];
    *(_OWORD *)v8 = 0u;
    *((_OWORD *)v8 + 1) = 0u;
    *((_QWORD *)v8 + 4) = 0;
    *(_QWORD *)&self->SBUIRemoteAlertServiceViewController_opaque[OBJC_IVAR____TtC19DiagnosticsReporter20RemoteViewController_feedbackController] = 0;
    v9 = a4;
    v10 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(v7);
  }
  else
  {
    v11 = &self->SBUIRemoteAlertServiceViewController_opaque[OBJC_IVAR____TtC19DiagnosticsReporter20RemoteViewController_diagnosticsLog];
    *(_OWORD *)v11 = 0u;
    *((_OWORD *)v11 + 1) = 0u;
    *((_QWORD *)v11 + 4) = 0;
    *(_QWORD *)&self->SBUIRemoteAlertServiceViewController_opaque[OBJC_IVAR____TtC19DiagnosticsReporter20RemoteViewController_feedbackController] = 0;
    v12 = a4;
    v10 = 0;
  }
  v15.receiver = self;
  v15.super_class = (Class)type metadata accessor for RemoteViewController();
  v13 = -[RemoteViewController initWithNibName:bundle:](&v15, "initWithNibName:bundle:", v10, a4);

  return v13;
}

- (_TtC19DiagnosticsReporter20RemoteViewController)initWithCoder:(id)a3
{
  unsigned __int8 *v4;
  objc_super v6;

  v4 = &self->SBUIRemoteAlertServiceViewController_opaque[OBJC_IVAR____TtC19DiagnosticsReporter20RemoteViewController_diagnosticsLog];
  *(_OWORD *)v4 = 0u;
  *((_OWORD *)v4 + 1) = 0u;
  *((_QWORD *)v4 + 4) = 0;
  *(_QWORD *)&self->SBUIRemoteAlertServiceViewController_opaque[OBJC_IVAR____TtC19DiagnosticsReporter20RemoteViewController_feedbackController] = 0;
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for RemoteViewController();
  return -[RemoteViewController initWithCoder:](&v6, "initWithCoder:", a3);
}

- (void).cxx_destruct
{
  sub_100004288((uint64_t)&self->SBUIRemoteAlertServiceViewController_opaque[OBJC_IVAR____TtC19DiagnosticsReporter20RemoteViewController_diagnosticsLog], &qword_100019E28);
  swift_release(*(_QWORD *)&self->SBUIRemoteAlertServiceViewController_opaque[OBJC_IVAR____TtC19DiagnosticsReporter20RemoteViewController_feedbackController]);
}

@end
