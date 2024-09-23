@implementation MenstrualCyclesOnboardingFactorsViewController.FooterView

- (_TtCC24MenstrualCyclesAppPlugin46MenstrualCyclesOnboardingFactorsViewController10FooterView)initWithFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  objc_class *ObjectType;
  uint64_t v9;
  id v10;
  _TtCC24MenstrualCyclesAppPlugin46MenstrualCyclesOnboardingFactorsViewController10FooterView *v11;
  objc_super v13;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  ObjectType = (objc_class *)swift_getObjectType();
  v9 = OBJC_IVAR____TtCC24MenstrualCyclesAppPlugin46MenstrualCyclesOnboardingFactorsViewController10FooterView_label;
  v10 = objc_allocWithZone(MEMORY[0x24BEBD708]);
  v11 = self;
  *(Class *)((char *)&self->super.super.super.isa + v9) = (Class)objc_msgSend(v10, sel_init);

  v13.receiver = v11;
  v13.super_class = ObjectType;
  return -[MenstrualCyclesOnboardingFactorsViewController.FooterView initWithFrame:](&v13, sel_initWithFrame_, x, y, width, height);
}

- (_TtCC24MenstrualCyclesAppPlugin46MenstrualCyclesOnboardingFactorsViewController10FooterView)initWithCoder:(id)a3
{
  uint64_t v5;
  id v6;
  id v7;
  _TtCC24MenstrualCyclesAppPlugin46MenstrualCyclesOnboardingFactorsViewController10FooterView *result;

  v5 = OBJC_IVAR____TtCC24MenstrualCyclesAppPlugin46MenstrualCyclesOnboardingFactorsViewController10FooterView_label;
  v6 = objc_allocWithZone(MEMORY[0x24BEBD708]);
  v7 = a3;
  *(Class *)((char *)&self->super.super.super.isa + v5) = (Class)objc_msgSend(v6, sel_init);

  result = (_TtCC24MenstrualCyclesAppPlugin46MenstrualCyclesOnboardingFactorsViewController10FooterView *)sub_231CA2A48();
  __break(1u);
  return result;
}

- (void)respondToContentSizeChanges
{
  void *v3;
  void *v4;
  uint64_t v5;
  _TtCC24MenstrualCyclesAppPlugin46MenstrualCyclesOnboardingFactorsViewController10FooterView *v6;
  id v7;

  v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtCC24MenstrualCyclesAppPlugin46MenstrualCyclesOnboardingFactorsViewController10FooterView_label);
  v4 = (void *)objc_opt_self();
  v5 = *MEMORY[0x24BEBE1D0];
  v6 = self;
  v7 = objc_msgSend(v4, sel__preferredFontForTextStyle_variant_, v5, 0);
  objc_msgSend(v3, sel_setFont_, v7);

}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtCC24MenstrualCyclesAppPlugin46MenstrualCyclesOnboardingFactorsViewController10FooterView_label));
}

@end
