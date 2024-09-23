@implementation PickerSelectLoggingCell

- (_TtC24MenstrualCyclesAppPlugin23PickerSelectLoggingCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  uint64_t v4;
  uint64_t v5;

  if (a4)
  {
    v4 = _sSo25HKMCDisplayTypeIdentifiera24MenstrualCyclesAppPluginE2idSSvg_0();
  }
  else
  {
    v4 = 0;
    v5 = 0;
  }
  return (_TtC24MenstrualCyclesAppPlugin23PickerSelectLoggingCell *)sub_231C3A0AC(v4, v5);
}

- (_TtC24MenstrualCyclesAppPlugin23PickerSelectLoggingCell)initWithCoder:(id)a3
{
  uint64_t v5;
  id v6;
  id v7;
  _OWORD *v8;
  _TtC24MenstrualCyclesAppPlugin23PickerSelectLoggingCell *result;

  v5 = OBJC_IVAR____TtC24MenstrualCyclesAppPlugin23PickerSelectLoggingCell_picker;
  v6 = objc_allocWithZone(MEMORY[0x24BEBD800]);
  v7 = a3;
  *(Class *)((char *)&self->super.super.super.super.isa + v5) = (Class)objc_msgSend(v6, sel_init);
  v8 = (_OWORD *)((char *)self + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin23PickerSelectLoggingCell_configuration);
  *(_OWORD *)((char *)v8 + 89) = 0u;
  v8[4] = 0u;
  v8[5] = 0u;
  v8[2] = 0u;
  v8[3] = 0u;
  *v8 = 0u;
  v8[1] = 0u;

  result = (_TtC24MenstrualCyclesAppPlugin23PickerSelectLoggingCell *)sub_231CA2A48();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin23PickerSelectLoggingCell_picker));
  objc_release(*(id *)((char *)&self->super.super._layerRetained
                     + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin23PickerSelectLoggingCell_configuration));
}

@end
