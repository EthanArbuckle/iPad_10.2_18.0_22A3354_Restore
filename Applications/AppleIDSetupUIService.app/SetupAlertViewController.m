@implementation SetupAlertViewController

- (_TtC21AppleIDSetupUIService24SetupAlertViewController)init
{
  objc_class *ObjectType;
  unsigned __int8 *v4;
  uint64_t v5;
  objc_super v7;

  ObjectType = (objc_class *)swift_getObjectType(self, a2);
  v4 = &self->super.SBUIRemoteAlertServiceViewController_opaque[OBJC_IVAR____TtC21AppleIDSetupUIService24SetupAlertViewController_presentationRequest];
  v5 = type metadata accessor for PresentationRequest(0);
  swift_storeEnumTagMultiPayload(v4, v5, 2);
  *(_QWORD *)&self->super.SBUIRemoteAlertServiceViewController_opaque[OBJC_IVAR____TtC21AppleIDSetupUIService24SetupAlertViewController_rootViewController] = 0;
  v7.receiver = self;
  v7.super_class = ObjectType;
  return -[BaseProxFlowViewController initWithNibName:bundle:](&v7, "initWithNibName:bundle:", 0, 0);
}

- (_TtC21AppleIDSetupUIService24SetupAlertViewController)initWithCoder:(id)a3
{
  unsigned __int8 *v5;
  uint64_t v6;
  id v7;
  _TtC21AppleIDSetupUIService24SetupAlertViewController *result;

  v5 = &self->super.SBUIRemoteAlertServiceViewController_opaque[OBJC_IVAR____TtC21AppleIDSetupUIService24SetupAlertViewController_presentationRequest];
  v6 = type metadata accessor for PresentationRequest(0);
  swift_storeEnumTagMultiPayload(v5, v6, 2);
  *(_QWORD *)&self->super.SBUIRemoteAlertServiceViewController_opaque[OBJC_IVAR____TtC21AppleIDSetupUIService24SetupAlertViewController_rootViewController] = 0;
  v7 = a3;

  result = (_TtC21AppleIDSetupUIService24SetupAlertViewController *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x800000010000C1C0, "AppleIDSetupUIService/SetupAlertViewController.swift", 52, 2, 27, 0);
  __break(1u);
  return result;
}

- (void)configureWithContext:(id)a3 completion:(id)a4
{
  uint64_t (*v6)();
  NSObject *v7;
  id v8;
  _TtC21AppleIDSetupUIService24SetupAlertViewController *v9;

  v6 = (uint64_t (*)())_Block_copy(a4);
  if (v6)
  {
    v7 = swift_allocObject(&unk_100010798, 24, 7);
    v7[2].isa = (Class)v6;
    v6 = sub_1000060DC;
  }
  else
  {
    v7 = 0;
  }
  v8 = a3;
  v9 = self;
  sub_1000040BC(a3, (void (*)(_QWORD))v6, v7);
  sub_100005F24((uint64_t)v6, (uint64_t)v7);

}

- (void)viewDidLoad
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)swift_getObjectType(self, a2);
  -[SetupAlertViewController viewDidLoad](&v2, "viewDidLoad");
}

- (void)viewWillAppear:(BOOL)a3
{
  _TtC21AppleIDSetupUIService24SetupAlertViewController *v4;

  v4 = self;
  sub_1000047E0(a3, (uint64_t)v4);

}

- (void)viewDidAppear:(BOOL)a3
{
  _TtC21AppleIDSetupUIService24SetupAlertViewController *v4;

  v4 = self;
  sub_1000049EC(a3, (uint64_t)v4);

}

- (void)viewDidDisappear:(BOOL)a3
{
  _TtC21AppleIDSetupUIService24SetupAlertViewController *v4;

  v4 = self;
  sub_100004C6C(a3, (uint64_t)v4);

}

- (void)dismissViewControllerAnimated:(BOOL)a3 completion:(id)a4
{
  void *v6;
  uint64_t v7;
  _TtC21AppleIDSetupUIService24SetupAlertViewController *v8;

  v6 = _Block_copy(a4);
  if (v6)
  {
    v7 = swift_allocObject(&unk_1000106F8, 24, 7);
    *(_QWORD *)(v7 + 16) = v6;
    v6 = sub_100005F58;
  }
  else
  {
    v7 = 0;
  }
  v8 = self;
  sub_100005D6C(a3, (uint64_t)v8);
  sub_100005F24((uint64_t)v6, v7);

}

- (void)handleButtonActions:(id)a3
{
  unint64_t v5;
  unint64_t v6;
  uint64_t v7;
  _TtC21AppleIDSetupUIService24SetupAlertViewController *v8;

  if (a3)
  {
    v5 = sub_100005C88();
    v6 = sub_100005CC4();
    v7 = static Set._unconditionallyBridgeFromObjectiveC(_:)(a3, v5, v6);
  }
  else
  {
    v7 = 0;
  }
  v8 = self;
  sub_100004EB0(v7);

  swift_bridgeObjectRelease(v7);
}

+ (BOOL)_isSecureForRemoteViewService
{
  return 1;
}

- (_TtC21AppleIDSetupUIService24SetupAlertViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4;
  _TtC21AppleIDSetupUIService24SetupAlertViewController *result;

  v4 = a4;
  result = (_TtC21AppleIDSetupUIService24SetupAlertViewController *)_swift_stdlib_reportUnimplementedInitializer("AppleIDSetupUIService.SetupAlertViewController", 46, "init(nibName:bundle:)", 21, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_100005C4C((uint64_t)self + OBJC_IVAR____TtC21AppleIDSetupUIService24SetupAlertViewController_presentationRequest);

}

@end
