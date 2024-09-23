@implementation ConnectionAssistantConnectionViewController

- (_TtC8SOSBuddy43ConnectionAssistantConnectionViewController)init
{
  return (_TtC8SOSBuddy43ConnectionAssistantConnectionViewController *)sub_100043974();
}

- (_TtC8SOSBuddy43ConnectionAssistantConnectionViewController)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_100045358();
}

- (void)viewDidLoad
{
  _TtC8SOSBuddy43ConnectionAssistantConnectionViewController *v2;

  v2 = self;
  sub_100043B70();

}

- (void)viewWillLayoutSubviews
{
  _TtC8SOSBuddy43ConnectionAssistantConnectionViewController *v2;

  v2 = self;
  sub_100043D0C();

}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (_TtC8SOSBuddy43ConnectionAssistantConnectionViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4;
  _TtC8SOSBuddy43ConnectionAssistantConnectionViewController *result;

  v4 = a4;
  result = (_TtC8SOSBuddy43ConnectionAssistantConnectionViewController *)_swift_stdlib_reportUnimplementedInitializer("SOSBuddy.ConnectionAssistantConnectionViewController", 52, "init(nibName:bundle:)", 21, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v3 = *(_QWORD *)&self->state[OBJC_IVAR____TtC8SOSBuddy43ConnectionAssistantConnectionViewController_state + 24];
  v4 = *(_QWORD *)&self->state[OBJC_IVAR____TtC8SOSBuddy43ConnectionAssistantConnectionViewController_state + 40];
  v5 = *(_QWORD *)&self->state[OBJC_IVAR____TtC8SOSBuddy43ConnectionAssistantConnectionViewController_state + 56];
  swift_bridgeObjectRelease(*(_QWORD *)&self->state[OBJC_IVAR____TtC8SOSBuddy43ConnectionAssistantConnectionViewController_state]);
  swift_bridgeObjectRelease(v3);
  swift_bridgeObjectRelease(v4);
  swift_bridgeObjectRelease(v5);
  swift_bridgeObjectRelease(*(_QWORD *)&self->state[OBJC_IVAR____TtC8SOSBuddy43ConnectionAssistantConnectionViewController__connectivityStatusText]);
  sub_10003DADC(*(uint64_t *)((char *)&self->super.super.super.isa+ OBJC_IVAR____TtC8SOSBuddy43ConnectionAssistantConnectionViewController_connectionGuidance), *(_QWORD *)&self->state[OBJC_IVAR____TtC8SOSBuddy43ConnectionAssistantConnectionViewController_connectionGuidance], *(_QWORD *)&self->state[OBJC_IVAR____TtC8SOSBuddy43ConnectionAssistantConnectionViewController_connectionGuidance+ 8], *(_QWORD *)&self->state[OBJC_IVAR____TtC8SOSBuddy43ConnectionAssistantConnectionViewController_connectionGuidance+ 16]);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8SOSBuddy43ConnectionAssistantConnectionViewController_exclusionPath));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8SOSBuddy43ConnectionAssistantConnectionViewController_guidanceTitleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8SOSBuddy43ConnectionAssistantConnectionViewController_guidanceSubtitleLabel));
}

@end
