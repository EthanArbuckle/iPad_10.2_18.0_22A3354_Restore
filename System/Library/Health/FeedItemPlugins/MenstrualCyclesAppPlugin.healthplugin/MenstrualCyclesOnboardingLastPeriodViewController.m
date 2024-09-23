@implementation MenstrualCyclesOnboardingLastPeriodViewController

- (void)viewDidLoad
{
  _TtC24MenstrualCyclesAppPlugin49MenstrualCyclesOnboardingLastPeriodViewController *v2;

  v2 = self;
  sub_231C8ABE4();

}

- (void)nextButtonTapped:(id)a3
{
  sub_2319555B4(self, (uint64_t)a2, (uint64_t)a3, (void (*)(uint64_t))sub_231C8B36C);
}

- (void)skipButtonTapped:(id)a3
{
  sub_2319555B4(self, (uint64_t)a2, (uint64_t)a3, (void (*)(uint64_t))sub_231C8B830);
}

- (void)datePickerChangedWithPicker:(id)a3
{
  id v4;
  _TtC24MenstrualCyclesAppPlugin49MenstrualCyclesOnboardingLastPeriodViewController *v5;
  id v6;

  v4 = a3;
  v5 = self;
  v6 = sub_231BC7918();
  objc_msgSend(v6, sel_setEnabled_, 1);

}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin49MenstrualCyclesOnboardingLastPeriodViewController____lazy_storage___periodLengthViewController));
}

@end
