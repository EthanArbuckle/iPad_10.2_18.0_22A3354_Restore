@implementation PregnancyModeTimelineCell

- (_TtC24MenstrualCyclesAppPlugin25PregnancyModeTimelineCell)initWithFrame:(CGRect)a3
{
  return (_TtC24MenstrualCyclesAppPlugin25PregnancyModeTimelineCell *)sub_231B52618(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC24MenstrualCyclesAppPlugin25PregnancyModeTimelineCell)initWithCoder:(id)a3
{
  char *v4;
  id v5;
  _TtC24MenstrualCyclesAppPlugin25PregnancyModeTimelineCell *result;

  *(Class *)((char *)&self->super.super.super.super.super.isa
           + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin25PregnancyModeTimelineCell_updateCurrentDayOperation) = 0;
  v4 = (char *)self + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin25PregnancyModeTimelineCell_item;
  *(_OWORD *)v4 = 0u;
  *((_OWORD *)v4 + 1) = 0u;
  *((_QWORD *)v4 + 4) = 0;
  v5 = a3;

  result = (_TtC24MenstrualCyclesAppPlugin25PregnancyModeTimelineCell *)sub_231CA2A48();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin25PregnancyModeTimelineCell_updateCurrentDayOperation));
  sub_2319B8DCC((uint64_t)self + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin25PregnancyModeTimelineCell_item);
}

@end
