@implementation InteractiveTimelineLegendLabel

- (_TtC24MenstrualCyclesAppPlugin30InteractiveTimelineLegendLabel)init
{
  return (_TtC24MenstrualCyclesAppPlugin30InteractiveTimelineLegendLabel *)sub_231AAC380();
}

- (_TtC24MenstrualCyclesAppPlugin30InteractiveTimelineLegendLabel)initWithCoder:(id)a3
{
  uint64_t v5;
  id v6;
  id v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  _TtC24MenstrualCyclesAppPlugin30InteractiveTimelineLegendLabel *result;

  v5 = OBJC_IVAR____TtC24MenstrualCyclesAppPlugin30InteractiveTimelineLegendLabel_textLabel;
  v6 = objc_allocWithZone(MEMORY[0x24BEBD708]);
  v7 = a3;
  *(Class *)((char *)&self->super.super.super.isa + v5) = (Class)objc_msgSend(v6, sel_init);
  v8 = OBJC_IVAR____TtC24MenstrualCyclesAppPlugin30InteractiveTimelineLegendLabel_spacerLabel;
  *(Class *)((char *)&self->super.super.super.isa + v8) = (Class)objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBD708]), sel_init);
  v9 = (char *)self + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin30InteractiveTimelineLegendLabel_cycleDay;
  v10 = type metadata accessor for CycleDay();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 56))(v9, 1, 1, v10);

  result = (_TtC24MenstrualCyclesAppPlugin30InteractiveTimelineLegendLabel *)sub_231CA2A48();
  __break(1u);
  return result;
}

- (_TtC24MenstrualCyclesAppPlugin30InteractiveTimelineLegendLabel)initWithFrame:(CGRect)a3
{
  _TtC24MenstrualCyclesAppPlugin30InteractiveTimelineLegendLabel *result;

  result = (_TtC24MenstrualCyclesAppPlugin30InteractiveTimelineLegendLabel *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin30InteractiveTimelineLegendLabel_textLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin30InteractiveTimelineLegendLabel_spacerLabel));
  sub_231AAD628((uint64_t)self + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin30InteractiveTimelineLegendLabel_cycleDay);
}

@end
