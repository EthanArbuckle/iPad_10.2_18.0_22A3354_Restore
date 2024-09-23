@implementation CalendarPickerTableViewCell

- (_TtC16HealthMobilityUI27CalendarPickerTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  uint64_t v5;
  uint64_t v6;

  if (a4)
  {
    a4 = (id)sub_1D77F4AE8();
    v6 = v5;
  }
  else
  {
    v6 = 0;
  }
  return (_TtC16HealthMobilityUI27CalendarPickerTableViewCell *)sub_1D77E4EDC(a3, (uint64_t)a4, v6);
}

- (_TtC16HealthMobilityUI27CalendarPickerTableViewCell)initWithCoder:(id)a3
{
  char *v4;
  id v5;
  _TtC16HealthMobilityUI27CalendarPickerTableViewCell *result;

  v4 = (char *)self + OBJC_IVAR____TtC16HealthMobilityUI27CalendarPickerTableViewCell_item;
  *(_OWORD *)v4 = 0u;
  *((_OWORD *)v4 + 1) = 0u;
  *((_QWORD *)v4 + 4) = 0;
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC16HealthMobilityUI27CalendarPickerTableViewCell____lazy_storage___picker) = 0;
  v5 = a3;

  result = (_TtC16HealthMobilityUI27CalendarPickerTableViewCell *)sub_1D77F4DA0();
  __break(1u);
  return result;
}

- (void)pickerDateChanged:(id)a3
{
  id v4;
  _TtC16HealthMobilityUI27CalendarPickerTableViewCell *v5;

  v4 = a3;
  v5 = self;
  sub_1D77E50D8(v4);

}

- (void).cxx_destruct
{
  sub_1D77DDC5C((uint64_t)self + OBJC_IVAR____TtC16HealthMobilityUI27CalendarPickerTableViewCell_item, (unint64_t *)&qword_1F012F0E0, (unint64_t *)&qword_1F012F0E8);
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC16HealthMobilityUI27CalendarPickerTableViewCell____lazy_storage___picker));
}

@end
