@implementation CycleFactorsSectionSingleFactorView

- (_TtC24MenstrualCyclesAppPlugin35CycleFactorsSectionSingleFactorView)initWithCoder:(id)a3
{
  uint64_t v5;
  id v6;
  id v7;
  uint64_t v8;
  _TtC24MenstrualCyclesAppPlugin35CycleFactorsSectionSingleFactorView *result;

  v5 = OBJC_IVAR____TtC24MenstrualCyclesAppPlugin35CycleFactorsSectionSingleFactorView_titleLabel;
  v6 = objc_allocWithZone(MEMORY[0x24BEBD708]);
  v7 = a3;
  *(Class *)((char *)&self->super.super.super.isa + v5) = (Class)objc_msgSend(v6, sel_init);
  v8 = OBJC_IVAR____TtC24MenstrualCyclesAppPlugin35CycleFactorsSectionSingleFactorView_subtitleLabel;
  *(Class *)((char *)&self->super.super.super.isa + v8) = (Class)objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBD708]), sel_init);

  result = (_TtC24MenstrualCyclesAppPlugin35CycleFactorsSectionSingleFactorView *)sub_231CA2A48();
  __break(1u);
  return result;
}

- (_TtC24MenstrualCyclesAppPlugin35CycleFactorsSectionSingleFactorView)initWithFrame:(CGRect)a3
{
  sub_2319C529C();
}

- (void).cxx_destruct
{
  sub_231A03AA8((uint64_t)self + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin35CycleFactorsSectionSingleFactorView_viewModel);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin35CycleFactorsSectionSingleFactorView_titleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin35CycleFactorsSectionSingleFactorView_subtitleLabel));
}

@end
