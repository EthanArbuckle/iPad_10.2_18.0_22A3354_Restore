@implementation ReviewOngoingCycleFactorsViewController

- (void)dealloc
{
  _TtC24MenstrualCyclesAppPlugin39ReviewOngoingCycleFactorsViewController *v2;

  v2 = self;
  sub_231BEA218();
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin39ReviewOngoingCycleFactorsViewController____lazy_storage___ongoingCycleFactorsViewController));
  swift_bridgeObjectRelease();
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
  _TtC24MenstrualCyclesAppPlugin39ReviewOngoingCycleFactorsViewController *v2;

  v2 = self;
  sub_231BEADD8();

}

- (void)skipButtonTapped:(id)a3
{
  sub_2319555B4(self, (uint64_t)a2, (uint64_t)a3, (void (*)(uint64_t))sub_231BEB734);
}

- (void)nextButtonTapped:(id)a3
{
  sub_2319555B4(self, (uint64_t)a2, (uint64_t)a3, (void (*)(uint64_t))sub_231BEB970);
}

- (void)respondToContentSizeChanges
{
  _TtC24MenstrualCyclesAppPlugin39ReviewOngoingCycleFactorsViewController *v2;

  v2 = self;
  sub_231BE8A04();

}

@end
