@implementation AddOngoingCycleFactorsViewController

- (void)dealloc
{
  _TtC24MenstrualCyclesAppPlugin36AddOngoingCycleFactorsViewController *v2;

  v2 = self;
  sub_231C3AD1C();
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  sub_231A058FC(*(unint64_t *)((char *)&self->super.super.super.super.super.super.super.super.isa
                                    + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin36AddOngoingCycleFactorsViewController_presentationContext));
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin36AddOngoingCycleFactorsViewController____lazy_storage___lastPeriodViewController));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin36AddOngoingCycleFactorsViewController_healthStore));
}

- (void)viewWillAppear:(BOOL)a3
{
  _TtC24MenstrualCyclesAppPlugin36AddOngoingCycleFactorsViewController *v4;

  v4 = self;
  sub_231C3AEB4(a3);

}

- (void)viewDidLayoutSubviews
{
  id v2;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)swift_getObjectType();
  v2 = v3.receiver;
  -[OBTableWelcomeController viewDidLayoutSubviews](&v3, sel_viewDidLayoutSubviews);
  sub_231BE8A04();

}

- (void)viewDidLoad
{
  _TtC24MenstrualCyclesAppPlugin36AddOngoingCycleFactorsViewController *v2;

  v2 = self;
  sub_231C3B024();

}

- (void)respondToContentSizeChanges
{
  _TtC24MenstrualCyclesAppPlugin36AddOngoingCycleFactorsViewController *v2;

  v2 = self;
  sub_231BE8A04();

}

- (void)skipButtonTapped:(id)a3
{
  sub_2319555B4(self, (uint64_t)a2, (uint64_t)a3, (void (*)(uint64_t))sub_231C3C084);
}

- (void)nextButtonTapped:(id)a3
{
  sub_2319555B4(self, (uint64_t)a2, (uint64_t)a3, (void (*)(uint64_t))sub_231C3C2BC);
}

- (void)doneButtonTapped
{
  _TtC24MenstrualCyclesAppPlugin36AddOngoingCycleFactorsViewController *v2;

  v2 = self;
  sub_231C3CD44();

}

@end
