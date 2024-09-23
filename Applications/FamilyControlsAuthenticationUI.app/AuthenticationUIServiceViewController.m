@implementation AuthenticationUIServiceViewController

- (_TtC30FamilyControlsAuthenticationUI37AuthenticationUIServiceViewController)init
{
  return (_TtC30FamilyControlsAuthenticationUI37AuthenticationUIServiceViewController *)sub_10000B410();
}

- (_TtC30FamilyControlsAuthenticationUI37AuthenticationUIServiceViewController)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_10000F284();
}

- (void)configureWithContext:(id)a3 completion:(id)a4
{
  void (*v6)(uint64_t);
  uint64_t v7;
  id v8;
  _TtC30FamilyControlsAuthenticationUI37AuthenticationUIServiceViewController *v9;

  v6 = (void (*)(uint64_t))_Block_copy(a4);
  if (v6)
  {
    v7 = swift_allocObject(&unk_100015420, 24, 7);
    *(_QWORD *)(v7 + 16) = v6;
    v6 = (void (*)(uint64_t))sub_10000F234;
  }
  else
  {
    v7 = 0;
  }
  v8 = a3;
  v9 = self;
  sub_10000B50C(a3, v6, v7);
  sub_10000F200((uint64_t)v6, v7);

}

- (_TtC30FamilyControlsAuthenticationUI37AuthenticationUIServiceViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4;
  _TtC30FamilyControlsAuthenticationUI37AuthenticationUIServiceViewController *result;

  v4 = a4;
  result = (_TtC30FamilyControlsAuthenticationUI37AuthenticationUIServiceViewController *)_swift_stdlib_reportUnimplementedInitializer("FamilyControlsAuthenticationUI.AuthenticationUIServiceViewController", 68, "init(nibName:bundle:)", 21, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease(*(_QWORD *)&self->SBUIRemoteAlertServiceViewController_opaque[OBJC_IVAR____TtC30FamilyControlsAuthenticationUI37AuthenticationUIServiceViewController_agentConnnection]);

  swift_unknownObjectRelease(*(_QWORD *)&self->SBUIRemoteAlertServiceViewController_opaque[OBJC_IVAR____TtC30FamilyControlsAuthenticationUI37AuthenticationUIServiceViewController____lazy_storage___authenicationResultsAgent]);
  swift_unknownObjectRelease(*(_QWORD *)&self->SBUIRemoteAlertServiceViewController_opaque[OBJC_IVAR____TtC30FamilyControlsAuthenticationUI37AuthenticationUIServiceViewController____lazy_storage___hostingAgent]);
}

- (void)viewDidDisappear:(BOOL)a3
{
  _BOOL8 v3;
  id v4;
  objc_super v5;

  v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for AuthenticationUIServiceViewController();
  v4 = v5.receiver;
  -[AuthenticationUIServiceViewController viewDidDisappear:](&v5, "viewDidDisappear:", v3);
  sub_10000CAC4();

}

@end
