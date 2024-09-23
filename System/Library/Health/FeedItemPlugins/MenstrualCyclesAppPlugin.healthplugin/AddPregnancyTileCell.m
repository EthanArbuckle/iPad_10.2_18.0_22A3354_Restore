@implementation AddPregnancyTileCell

- (_TtC24MenstrualCyclesAppPlugin20AddPregnancyTileCell)initWithFrame:(CGRect)a3
{
  return (_TtC24MenstrualCyclesAppPlugin20AddPregnancyTileCell *)sub_231BBDDD4(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC24MenstrualCyclesAppPlugin20AddPregnancyTileCell)initWithCoder:(id)a3
{
  char *v4;
  id v5;
  _TtC24MenstrualCyclesAppPlugin20AddPregnancyTileCell *result;

  *(Class *)((char *)&self->super.super.super.super.super.isa
           + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin20AddPregnancyTileCell_parentViewController) = 0;
  v4 = (char *)self + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin20AddPregnancyTileCell_item;
  *(_OWORD *)v4 = 0u;
  *((_OWORD *)v4 + 1) = 0u;
  *((_QWORD *)v4 + 4) = 0;
  v5 = a3;

  result = (_TtC24MenstrualCyclesAppPlugin20AddPregnancyTileCell *)sub_231CA2A48();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin20AddPregnancyTileCell_parentViewController));
  sub_2319B8DCC((uint64_t)self + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin20AddPregnancyTileCell_item);
}

@end
