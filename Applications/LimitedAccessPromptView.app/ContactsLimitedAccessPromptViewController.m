@implementation ContactsLimitedAccessPromptViewController

- (unint64_t)supportedInterfaceOrientations
{
  void *v3;
  _TtC23LimitedAccessPromptView41ContactsLimitedAccessPromptViewController *v4;
  id v5;
  id v6;

  v3 = (void *)objc_opt_self(UIDevice);
  v4 = self;
  v5 = objc_msgSend(v3, "currentDevice");
  v6 = objc_msgSend(v5, "userInterfaceIdiom");

  if (v6 == (id)1)
    return 30;
  else
    return 2;
}

- (void)viewDidLoad
{
  _TtC23LimitedAccessPromptView41ContactsLimitedAccessPromptViewController *v2;

  v2 = self;
  sub_100011CE4();

}

- (void)prepareForActivationWithContext:(id)a3 completion:(id)a4
{
  void *v6;
  uint64_t v7;
  id v8;
  _TtC23LimitedAccessPromptView41ContactsLimitedAccessPromptViewController *v9;

  v6 = _Block_copy(a4);
  if (v6)
  {
    v7 = swift_allocObject(&unk_100021A68, 24, 7);
    *(_QWORD *)(v7 + 16) = v6;
    v6 = sub_10001448C;
  }
  else
  {
    v7 = 0;
  }
  v8 = a3;
  v9 = self;
  sub_1000134D0(a3);
  sub_10000758C((uint64_t)v6, v7);

}

- (void)dismissViewControllerAnimated:(BOOL)a3 completion:(id)a4
{
  _BOOL8 v4;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  _TtC23LimitedAccessPromptView41ContactsLimitedAccessPromptViewController *v11;
  objc_super v12;
  _QWORD aBlock[5];
  uint64_t v14;

  v4 = a3;
  v6 = _Block_copy(a4);
  if (v6)
  {
    v7 = swift_allocObject(&unk_100021A40, 24, 7);
    *(_QWORD *)(v7 + 16) = v6;
    v6 = sub_1000143D4;
  }
  else
  {
    v7 = 0;
  }
  v8 = swift_allocObject(&unk_1000219F0, 32, 7);
  *(_QWORD *)(v8 + 16) = v6;
  *(_QWORD *)(v8 + 24) = v7;
  aBlock[4] = sub_100014360;
  v14 = v8;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = sub_100007140;
  aBlock[3] = &unk_100021A08;
  v9 = _Block_copy(aBlock);
  v10 = v14;
  v11 = self;
  sub_1000143A0((uint64_t)v6, v7);
  swift_release(v10);
  v12.receiver = v11;
  v12.super_class = (Class)type metadata accessor for ContactsLimitedAccessPromptViewController();
  -[ContactsLimitedAccessPromptViewController dismissViewControllerAnimated:completion:](&v12, "dismissViewControllerAnimated:completion:", v4, v9);
  _Block_release(v9);
  sub_10000758C((uint64_t)v6, v7);

}

- (_TtC23LimitedAccessPromptView41ContactsLimitedAccessPromptViewController)initWithNibName:(id)a3 bundle:(id)a4
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
  return (_TtC23LimitedAccessPromptView41ContactsLimitedAccessPromptViewController *)sub_100012590(v5, v7, a4);
}

- (_TtC23LimitedAccessPromptView41ContactsLimitedAccessPromptViewController)initWithCoder:(id)a3
{
  return (_TtC23LimitedAccessPromptView41ContactsLimitedAccessPromptViewController *)sub_1000126CC(a3);
}

- (void).cxx_destruct
{
  swift_release(*(_QWORD *)&self->SBUIRemoteAlertServiceViewController_opaque[OBJC_IVAR____TtC23LimitedAccessPromptView41ContactsLimitedAccessPromptViewController_observer]);
  swift_bridgeObjectRelease(*(_QWORD *)&self->observer[OBJC_IVAR____TtC23LimitedAccessPromptView41ContactsLimitedAccessPromptViewController_requestorBundleID]);

}

@end
