@implementation CycleHistoryYearSectionHeader

- (_TtC24MenstrualCyclesAppPlugin29CycleHistoryYearSectionHeader)initWithReuseIdentifier:(id)a3
{
  uint64_t v3;
  uint64_t v4;

  if (a3)
  {
    v3 = _sSo25HKMCDisplayTypeIdentifiera24MenstrualCyclesAppPluginE2idSSvg_0();
  }
  else
  {
    v3 = 0;
    v4 = 0;
  }
  return (_TtC24MenstrualCyclesAppPlugin29CycleHistoryYearSectionHeader *)sub_231929994(v3, v4);
}

- (_TtC24MenstrualCyclesAppPlugin29CycleHistoryYearSectionHeader)initWithCoder:(id)a3
{
  uint64_t v5;
  id v6;
  id v7;
  uint64_t v8;
  _TtC24MenstrualCyclesAppPlugin29CycleHistoryYearSectionHeader *result;

  v5 = OBJC_IVAR____TtC24MenstrualCyclesAppPlugin29CycleHistoryYearSectionHeader_yearLabel;
  v6 = objc_allocWithZone(MEMORY[0x24BEBD708]);
  v7 = a3;
  *(Class *)((char *)&self->super.super.super.super.isa + v5) = (Class)objc_msgSend(v6, sel_init);
  v8 = OBJC_IVAR____TtC24MenstrualCyclesAppPlugin29CycleHistoryYearSectionHeader_headerSeparator;
  *(Class *)((char *)&self->super.super.super.super.isa + v8) = (Class)objc_msgSend(objc_allocWithZone(MEMORY[0x24BE4A838]), sel_initWithFrame_, 0.0, 0.0, 0.0, 0.0);

  result = (_TtC24MenstrualCyclesAppPlugin29CycleHistoryYearSectionHeader *)sub_231CA2A48();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin29CycleHistoryYearSectionHeader_yearLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin29CycleHistoryYearSectionHeader_headerSeparator));
}

@end
