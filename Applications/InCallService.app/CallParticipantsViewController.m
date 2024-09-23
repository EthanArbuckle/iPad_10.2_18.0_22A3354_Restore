@implementation CallParticipantsViewController

- (void)viewWillAppear:(BOOL)a3
{
  _TtC13InCallService30CallParticipantsViewController *v4;

  v4 = self;
  sub_1001453F4(a3);

}

- (id)currentCallGroups
{
  _TtC13InCallService30CallParticipantsViewController *v2;
  uint64_t v3;
  Class isa;

  v2 = self;
  v3 = sub_10014569C();

  sub_1001458D0();
  isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v3);
  return isa;
}

- (_TtC13InCallService30CallParticipantsViewController)initWithCallDisplayStyleManager:(id)a3
{
  id v4;

  v4 = a3;
  return (_TtC13InCallService30CallParticipantsViewController *)sub_100145764(a3);
}

- (_TtC13InCallService30CallParticipantsViewController)initWithCallDisplayStyleManager:(id)a3 contactsCache:(id)a4
{
  id v6;
  id v7;

  v6 = a3;
  v7 = a4;
  return (_TtC13InCallService30CallParticipantsViewController *)sub_1001457DC(a3, a4);
}

@end
