@implementation SVSInterventionViewController

- (void)configureWithContext:(id)a3 completion:(id)a4
{
  void (*v6)(void);
  uint64_t v7;
  id v8;
  SVSInterventionViewController *v9;

  v6 = (void (*)(void))_Block_copy(a4);
  if (v6)
  {
    v7 = swift_allocObject(&unk_10017B770, 24, 7);
    *(_QWORD *)(v7 + 16) = v6;
    v6 = (void (*)(void))sub_10005B9E4;
  }
  else
  {
    v7 = 0;
  }
  v8 = a3;
  v9 = self;
  sub_10009A490(a3, v6);
  sub_100012F60((uint64_t)v6, v7);

}

- (void)viewIsAppearing:(BOOL)a3
{
  SVSInterventionViewController *v4;

  v4 = self;
  sub_10009AADC(a3);

}

- (unint64_t)supportedInterfaceOrientations
{
  return 30;
}

- (void)viewDidLoad
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)type metadata accessor for SVSInterventionViewController(0);
  -[SVSInterventionViewController viewDidLoad](&v2, "viewDidLoad");
}

- (void)_willAppearInRemoteViewController
{
  id v2;
  void *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for SVSInterventionViewController(0);
  v2 = v5.receiver;
  -[SVSBaseMainController _willAppearInRemoteViewController](&v5, "_willAppearInRemoteViewController");
  v3 = (void *)sub_10009AE00();
  if (v3)
  {
    v4 = v3;
    objc_msgSend(v3, "setAllowsAlertStacking:", 1, v5.receiver, v5.super_class);

    swift_unknownObjectRelease(v4);
  }
  else
  {

  }
}

- (void)didConfirmForInterventionViewController:(id)a3
{
  sub_10009AF6C(self, (uint64_t)a2, (uint64_t)a3, "Intervention ViewController did confirm", (unsigned int *)&enum case for SFInterventionResponse.accept(_:));
}

- (void)didRejectForInterventionViewController:(id)a3
{
  sub_10009AF6C(self, (uint64_t)a2, (uint64_t)a3, "Intervention ViewController did reject", (unsigned int *)&enum case for SFInterventionResponse.reject(_:));
}

- (void)didContactSomeoneForInterventionViewController:(id)a3
{
  SVSInterventionViewController *v5;

  swift_unknownObjectRetain(a3);
  v5 = self;
  sub_10009B9B8();
  swift_unknownObjectRelease(a3);

}

- (SVSInterventionViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
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
  return (SVSInterventionViewController *)sub_10009B01C(v5, v7, a4);
}

- (SVSInterventionViewController)initWithCoder:(id)a3
{
  unsigned __int8 *v5;
  uint64_t v6;
  uint64_t v7;
  objc_super v9;

  *(_QWORD *)&self->super.SBUIRemoteAlertServiceViewController_opaque[OBJC_IVAR___SVSInterventionViewController_interventionViewController] = 0;
  *(_QWORD *)&self->super.SBUIRemoteAlertServiceViewController_opaque[OBJC_IVAR___SVSInterventionViewController_interventionReplyAction] = 0;
  v5 = &self->super.SBUIRemoteAlertServiceViewController_opaque[OBJC_IVAR___SVSInterventionViewController_workflow];
  v6 = enum case for SFInterventionWorkflow.receive(_:);
  v7 = type metadata accessor for SFInterventionWorkflow(0);
  (*(void (**)(unsigned __int8 *, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 104))(v5, v6, v7);
  v9.receiver = self;
  v9.super_class = (Class)type metadata accessor for SVSInterventionViewController(0);
  return -[SVSInterventionViewController initWithCoder:](&v9, "initWithCoder:", a3);
}

- (void).cxx_destruct
{
  unsigned __int8 *v3;
  uint64_t v4;

  v3 = &self->super.SBUIRemoteAlertServiceViewController_opaque[OBJC_IVAR___SVSInterventionViewController_workflow];
  v4 = type metadata accessor for SFInterventionWorkflow(0);
  (*(void (**)(unsigned __int8 *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
}

@end
