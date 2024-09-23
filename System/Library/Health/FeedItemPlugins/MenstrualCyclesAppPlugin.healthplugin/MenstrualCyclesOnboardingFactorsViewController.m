@implementation MenstrualCyclesOnboardingFactorsViewController

- (void)viewDidLoad
{
  _TtC24MenstrualCyclesAppPlugin46MenstrualCyclesOnboardingFactorsViewController *v2;

  v2 = self;
  sub_231BE6CCC();

}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  id v10;
  _TtC24MenstrualCyclesAppPlugin46MenstrualCyclesOnboardingFactorsViewController *v11;
  uint64_t v12;

  v6 = sub_231C9D438();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6);
  v9 = (char *)&v12 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_231C9D3E4();
  v10 = a3;
  v11 = self;
  sub_231BE80C0(v10, (uint64_t)v9);

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
}

- (void)viewWillLayoutSubviews
{
  _TtC24MenstrualCyclesAppPlugin46MenstrualCyclesOnboardingFactorsViewController *v2;

  v2 = self;
  sub_231BE8FAC();

}

- (void)cancelButtonTapped:(id)a3
{
  sub_2319555B4(self, (uint64_t)a2, (uint64_t)a3, (void (*)(uint64_t))sub_231BE9094);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin46MenstrualCyclesOnboardingFactorsViewController_tableFooterView));
  swift_release();
  _s24MenstrualCyclesAppPlugin32NotificationAuthorizationManagerVwxx_0((uint64_t)self+ OBJC_IVAR____TtC24MenstrualCyclesAppPlugin46MenstrualCyclesOnboardingFactorsViewController_pinnedContentManager);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin46MenstrualCyclesOnboardingFactorsViewController_nextButton));
  _s24MenstrualCyclesAppPlugin32NotificationAuthorizationManagerVwxx_0((uint64_t)self+ OBJC_IVAR____TtC24MenstrualCyclesAppPlugin46MenstrualCyclesOnboardingFactorsViewController_scaleFactorConfiguration);
  swift_bridgeObjectRelease();
  sub_23190C114((uint64_t)self + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin46MenstrualCyclesOnboardingFactorsViewController_delegate);
  swift_release();
  swift_release();
}

- (id)tableView:(id)a3 viewForHeaderInSection:(int64_t)a4
{
  id v6;
  _TtC24MenstrualCyclesAppPlugin46MenstrualCyclesOnboardingFactorsViewController *v7;
  char *v8;

  v6 = a3;
  v7 = self;
  v8 = sub_231BEF50C((char *)a4);

  return v8;
}

- (double)tableView:(id)a3 heightForHeaderInSection:(int64_t)a4
{
  id v6;
  _TtC24MenstrualCyclesAppPlugin46MenstrualCyclesOnboardingFactorsViewController *v7;
  uint64_t v8;
  uint64_t v9;
  double v10;
  double result;

  if (*(Class *)((char *)&self->super.super.super.super.super.super.super.isa
                + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin46MenstrualCyclesOnboardingFactorsViewController_mutableDataSource))
  {
    v6 = a3;
    v7 = self;
    swift_retain();
    sub_231B6BE5C(a4);
    v9 = v8;
    swift_release();
    swift_bridgeObjectRelease();
    if (v9)
      v10 = *MEMORY[0x24BEBE770];
    else
      v10 = 10.0;

    return v10;
  }
  else
  {
    __break(1u);
  }
  return result;
}

- (id)tableView:(id)a3 viewForFooterInSection:(int64_t)a4
{
  id v6;
  _TtC24MenstrualCyclesAppPlugin46MenstrualCyclesOnboardingFactorsViewController *v7;
  char *v8;

  v6 = a3;
  v7 = self;
  v8 = sub_231BEF650((char *)a4);

  return v8;
}

- (double)tableView:(id)a3 heightForFooterInSection:(int64_t)a4
{
  id v6;
  _TtC24MenstrualCyclesAppPlugin46MenstrualCyclesOnboardingFactorsViewController *v7;
  double v8;
  double v9;

  v6 = a3;
  v7 = self;
  sub_231BEF704(a4);
  v9 = v8;

  return v9;
}

@end
