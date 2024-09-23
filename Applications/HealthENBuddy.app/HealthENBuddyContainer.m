@implementation HealthENBuddyContainer

- (BOOL)shouldAutorotate
{
  return 0;
}

- (unint64_t)supportedInterfaceOrientations
{
  return 2;
}

- (void)viewDidLoad
{
  id v2;
  id v3;
  void *v4;
  id v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for HealthENBuddyContainer();
  v2 = v6.receiver;
  -[HealthENBuddyContainer viewDidLoad](&v6, "viewDidLoad");
  v3 = objc_msgSend(v2, "view", v6.receiver, v6.super_class);
  if (v3)
  {
    v4 = v3;
    v5 = objc_msgSend((id)objc_opt_self(UIColor), "clearColor");
    objc_msgSend(v4, "setBackgroundColor:", v5);

  }
  else
  {
    __break(1u);
  }
}

- (void)viewDidAppear:(BOOL)a3
{
  _BOOL4 v3;
  _TtC13HealthENBuddy22HealthENBuddyContainer *v4;

  v3 = a3;
  v4 = self;
  sub_1000052F4(v3);

}

- (void)configureWithContext:(id)a3 completion:(id)a4
{
  void (*v6)(_QWORD);
  uint64_t v7;
  id v8;
  _TtC13HealthENBuddy22HealthENBuddyContainer *v9;

  v6 = (void (*)(_QWORD))_Block_copy(a4);
  if (v6)
  {
    v7 = swift_allocObject(&unk_10000C598, 24, 7);
    *(_QWORD *)(v7 + 16) = v6;
    v6 = (void (*)(_QWORD))sub_100008AE8;
  }
  else
  {
    v7 = 0;
  }
  v8 = a3;
  v9 = self;
  sub_100006CD0(a3, v6, v7);
  sub_1000086F8((uint64_t)v6, v7);

}

- (void)prepareForActivationWithContext:(id)a3 completion:(id)a4
{
  uint64_t (*v6)(uint64_t);
  uint64_t v7;
  id v8;
  _TtC13HealthENBuddy22HealthENBuddyContainer *v9;

  v6 = (uint64_t (*)(uint64_t))_Block_copy(a4);
  if (v6)
  {
    v7 = swift_allocObject(&unk_10000C548, 24, 7);
    *(_QWORD *)(v7 + 16) = v6;
    v6 = (uint64_t (*)(uint64_t))sub_10000872C;
  }
  else
  {
    v7 = 0;
  }
  v8 = a3;
  v9 = self;
  sub_1000081C8(v6, v7);
  sub_1000086F8((uint64_t)v6, v7);

}

- (void)handleButtonActions:(id)a3
{
  id v3;
  uint64_t v5;
  unint64_t v6;
  _TtC13HealthENBuddy22HealthENBuddyContainer *v7;

  v3 = a3;
  if (a3)
  {
    v5 = sub_100008958(0, &qword_1000120A8, SBUIRemoteAlertButtonAction_ptr);
    v6 = sub_100008698();
    v3 = (id)static Set._unconditionallyBridgeFromObjectiveC(_:)(v3, v5, v6);
  }
  v7 = self;
  sub_100008408((uint64_t)v3);

  swift_bridgeObjectRelease(v3);
}

- (_TtC13HealthENBuddy22HealthENBuddyContainer)initWithNibName:(id)a3 bundle:(id)a4
{
  uint64_t v6;
  uint64_t v7;
  id v8;
  NSString v9;
  id v10;
  _TtC13HealthENBuddy22HealthENBuddyContainer *v11;
  objc_super v13;

  if (a3)
  {
    static String._unconditionallyBridgeFromObjectiveC(_:)(a3, a2);
    v7 = v6;
    *(_QWORD *)&self->SBUIRemoteAlertServiceViewController_opaque[OBJC_IVAR____TtC13HealthENBuddy22HealthENBuddyContainer_region] = 0;
    self->SBUIRemoteAlertServiceViewController_opaque[OBJC_IVAR____TtC13HealthENBuddy22HealthENBuddyContainer_didPresent] = 0;
    v8 = a4;
    v9 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(v7);
  }
  else
  {
    *(_QWORD *)&self->SBUIRemoteAlertServiceViewController_opaque[OBJC_IVAR____TtC13HealthENBuddy22HealthENBuddyContainer_region] = 0;
    self->SBUIRemoteAlertServiceViewController_opaque[OBJC_IVAR____TtC13HealthENBuddy22HealthENBuddyContainer_didPresent] = 0;
    v10 = a4;
    v9 = 0;
  }
  v13.receiver = self;
  v13.super_class = (Class)type metadata accessor for HealthENBuddyContainer();
  v11 = -[HealthENBuddyContainer initWithNibName:bundle:](&v13, "initWithNibName:bundle:", v9, a4);

  return v11;
}

- (_TtC13HealthENBuddy22HealthENBuddyContainer)initWithCoder:(id)a3
{
  objc_super v5;

  *(_QWORD *)&self->SBUIRemoteAlertServiceViewController_opaque[OBJC_IVAR____TtC13HealthENBuddy22HealthENBuddyContainer_region] = 0;
  self->SBUIRemoteAlertServiceViewController_opaque[OBJC_IVAR____TtC13HealthENBuddy22HealthENBuddyContainer_didPresent] = 0;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for HealthENBuddyContainer();
  return -[HealthENBuddyContainer initWithCoder:](&v5, "initWithCoder:", a3);
}

- (void).cxx_destruct
{

}

@end
