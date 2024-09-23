@implementation CycleDeviationsSectionCell

- (BOOL)isHighlighted
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)swift_getObjectType();
  return -[CycleDeviationsSectionCell isHighlighted](&v3, sel_isHighlighted);
}

- (void)setHighlighted:(BOOL)a3
{
  _BOOL8 v3;
  id v4;
  objc_super v5;

  v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)swift_getObjectType();
  v4 = v5.receiver;
  -[CycleDeviationsSectionCell setHighlighted:](&v5, sel_setHighlighted_, v3);
  sub_231BCE0A0();

}

- (_TtC24MenstrualCyclesAppPlugin26CycleDeviationsSectionCell)initWithFrame:(CGRect)a3
{
  return (_TtC24MenstrualCyclesAppPlugin26CycleDeviationsSectionCell *)sub_231BCE210(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC24MenstrualCyclesAppPlugin26CycleDeviationsSectionCell)initWithCoder:(id)a3
{
  char *v4;
  id v5;
  _TtC24MenstrualCyclesAppPlugin26CycleDeviationsSectionCell *result;

  v4 = (char *)self + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin26CycleDeviationsSectionCell_item;
  *(_OWORD *)v4 = 0u;
  *((_OWORD *)v4 + 1) = 0u;
  *((_QWORD *)v4 + 4) = 0;
  v5 = a3;

  result = (_TtC24MenstrualCyclesAppPlugin26CycleDeviationsSectionCell *)sub_231CA2A48();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_23191BD58((uint64_t)self + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin26CycleDeviationsSectionCell_item, (uint64_t (*)(_QWORD))sub_231933B98);
}

@end
