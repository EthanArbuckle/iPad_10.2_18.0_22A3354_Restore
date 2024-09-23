@implementation CycleLogSubheader

- (_TtC24MenstrualCyclesAppPlugin17CycleLogSubheader)initWithFrame:(CGRect)a3
{
  return (_TtC24MenstrualCyclesAppPlugin17CycleLogSubheader *)sub_231933630(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC24MenstrualCyclesAppPlugin17CycleLogSubheader)initWithCoder:(id)a3
{
  char *v4;
  id v5;
  _TtC24MenstrualCyclesAppPlugin17CycleLogSubheader *result;

  v4 = (char *)self + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin17CycleLogSubheader_item;
  *(_OWORD *)v4 = 0u;
  *((_OWORD *)v4 + 1) = 0u;
  *((_QWORD *)v4 + 4) = 0;
  v5 = a3;

  result = (_TtC24MenstrualCyclesAppPlugin17CycleLogSubheader *)sub_231CA2A48();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_23191BD58((uint64_t)self + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin17CycleLogSubheader_item, (uint64_t (*)(_QWORD))sub_231933B98);
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin17CycleLogSubheader_contentView));
}

@end
