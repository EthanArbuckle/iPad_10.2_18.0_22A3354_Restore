@implementation PregnancyTileCell

- (_TtC24MenstrualCyclesAppPlugin17PregnancyTileCell)initWithFrame:(CGRect)a3
{
  return (_TtC24MenstrualCyclesAppPlugin17PregnancyTileCell *)sub_231B6B084(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC24MenstrualCyclesAppPlugin17PregnancyTileCell)initWithCoder:(id)a3
{
  char *v4;
  id v5;
  _TtC24MenstrualCyclesAppPlugin17PregnancyTileCell *result;

  v4 = (char *)self + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin17PregnancyTileCell_item;
  *(_OWORD *)v4 = 0u;
  *((_OWORD *)v4 + 1) = 0u;
  *((_QWORD *)v4 + 4) = 0;
  v5 = a3;

  result = (_TtC24MenstrualCyclesAppPlugin17PregnancyTileCell *)sub_231CA2A48();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_231996A70((uint64_t)self + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin17PregnancyTileCell_item, (unint64_t *)&qword_255F4A910, (void (*)(uint64_t))sub_23191CDD0);
}

@end
