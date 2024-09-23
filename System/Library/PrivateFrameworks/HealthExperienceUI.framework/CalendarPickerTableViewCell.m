@implementation CalendarPickerTableViewCell

- (_TtC18HealthExperienceUI27CalendarPickerTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  uint64_t v5;
  uint64_t v6;

  if (a4)
  {
    a4 = (id)_sSo19HKFeatureIdentifiera18HealthExperienceUIE2idSSvg_0();
    v6 = v5;
  }
  else
  {
    v6 = 0;
  }
  return (_TtC18HealthExperienceUI27CalendarPickerTableViewCell *)CalendarPickerTableViewCell.init(style:reuseIdentifier:)(a3, (uint64_t)a4, v6);
}

- (_TtC18HealthExperienceUI27CalendarPickerTableViewCell)initWithCoder:(id)a3
{
  char *v4;
  id v5;
  _TtC18HealthExperienceUI27CalendarPickerTableViewCell *result;

  v4 = (char *)self + OBJC_IVAR____TtC18HealthExperienceUI27CalendarPickerTableViewCell_item;
  *(_OWORD *)v4 = 0u;
  *((_OWORD *)v4 + 1) = 0u;
  *((_QWORD *)v4 + 4) = 0;
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC18HealthExperienceUI27CalendarPickerTableViewCell____lazy_storage___picker) = 0;
  v5 = a3;

  result = (_TtC18HealthExperienceUI27CalendarPickerTableViewCell *)sub_1A9A96970();
  __break(1u);
  return result;
}

- (void)pickerDateChanged:(id)a3
{
  id v4;
  _TtC18HealthExperienceUI27CalendarPickerTableViewCell *v5;

  v4 = a3;
  v5 = self;
  sub_1A9A6FD78(v4);

}

- (void).cxx_destruct
{
  sub_1A961F39C((uint64_t)self + OBJC_IVAR____TtC18HealthExperienceUI27CalendarPickerTableViewCell_item, (unint64_t *)&qword_1ED27B9E0, (unint64_t *)&qword_1ED27B9D0);
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC18HealthExperienceUI27CalendarPickerTableViewCell____lazy_storage___picker));
}

@end
