@implementation DataTypeLoggingCell

- (BOOL)axIsChecked
{
  return *((_BYTE *)&self->super.super.super.super.isa
         + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin19DataTypeLoggingCell_isChecked);
}

- (_TtC24MenstrualCyclesAppPlugin19DataTypeLoggingCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
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
  return (_TtC24MenstrualCyclesAppPlugin19DataTypeLoggingCell *)sub_231A6AD98(v4, v5);
}

- (_TtC24MenstrualCyclesAppPlugin19DataTypeLoggingCell)initWithCoder:(id)a3
{
  char *v4;
  id v5;
  _TtC24MenstrualCyclesAppPlugin19DataTypeLoggingCell *result;

  v4 = (char *)self + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin19DataTypeLoggingCell_configuration;
  *(_OWORD *)v4 = 0u;
  *((_OWORD *)v4 + 1) = 0u;
  *((_QWORD *)v4 + 4) = 0;
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin19DataTypeLoggingCell_accessoryImage) = 0;
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin19DataTypeLoggingCell_tintAccessoryColor) = 0;
  *((_BYTE *)&self->super.super.super.super.isa
  + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin19DataTypeLoggingCell_isChecked) = 0;
  *((_BYTE *)&self->super.super.super.super.isa
  + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin19DataTypeLoggingCell_editableDaySummarySection) = 7;
  v5 = a3;

  result = (_TtC24MenstrualCyclesAppPlugin19DataTypeLoggingCell *)sub_231CA2A48();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_231A1EF28((uint64_t)self + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin19DataTypeLoggingCell_configuration);
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin19DataTypeLoggingCell_accessoryImage));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin19DataTypeLoggingCell_tintAccessoryColor));
}

@end
