@implementation MenstrualCyclesOnboardingItemCell

- (_TtC24MenstrualCyclesAppPlugin33MenstrualCyclesOnboardingItemCell)initWithFrame:(CGRect)a3
{
  return (_TtC24MenstrualCyclesAppPlugin33MenstrualCyclesOnboardingItemCell *)sub_231C66B80(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC24MenstrualCyclesAppPlugin33MenstrualCyclesOnboardingItemCell)initWithCoder:(id)a3
{
  char *v4;
  objc_super v6;

  v4 = (char *)self + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin33MenstrualCyclesOnboardingItemCell_item;
  *(_OWORD *)v4 = 0u;
  *((_OWORD *)v4 + 1) = 0u;
  *((_QWORD *)v4 + 4) = 0;
  *(Class *)((char *)&self->super.super.super.super.super.isa
           + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin33MenstrualCyclesOnboardingItemCell____lazy_storage___hostView) = 0;
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for MenstrualCyclesOnboardingItemCell();
  return -[MenstrualCyclesOnboardingItemCell initWithCoder:](&v6, sel_initWithCoder_, a3);
}

- (void)awakeFromNib
{
  _TtC24MenstrualCyclesAppPlugin33MenstrualCyclesOnboardingItemCell *v2;

  v2 = self;
  sub_231C66EE4();

}

- (void).cxx_destruct
{
  sub_2319B8DCC((uint64_t)self + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin33MenstrualCyclesOnboardingItemCell_item);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin33MenstrualCyclesOnboardingItemCell____lazy_storage___hostView));
}

@end
