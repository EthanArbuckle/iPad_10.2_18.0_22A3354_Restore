@implementation CalendarTodayLabel

- (_TtC24MenstrualCyclesAppPlugin18CalendarTodayLabel)initWithCoder:(id)a3
{
  uint64_t v5;
  id v6;
  id v7;
  id v8;
  _TtC24MenstrualCyclesAppPlugin18CalendarTodayLabel *result;

  v5 = OBJC_IVAR____TtC24MenstrualCyclesAppPlugin18CalendarTodayLabel_ring;
  v6 = objc_allocWithZone(MEMORY[0x24BDE5758]);
  v7 = a3;
  v8 = objc_msgSend(v6, sel_init);
  if (qword_255F3C8A0 != -1)
    swift_once();
  objc_msgSend(v8, sel_setLineWidth_, *(double *)&qword_255F3E080);
  objc_msgSend(v8, sel_setFillColor_, 0);
  *(Class *)((char *)&self->super.super.super.super.isa + v5) = (Class)v8;

  result = (_TtC24MenstrualCyclesAppPlugin18CalendarTodayLabel *)sub_231CA2A48();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin18CalendarTodayLabel_ring));
}

@end
