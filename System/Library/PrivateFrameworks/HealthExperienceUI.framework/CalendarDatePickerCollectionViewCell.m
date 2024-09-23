@implementation CalendarDatePickerCollectionViewCell

- (_TtC18HealthExperienceUI36CalendarDatePickerCollectionViewCell)initWithFrame:(CGRect)a3
{
  return (_TtC18HealthExperienceUI36CalendarDatePickerCollectionViewCell *)sub_1A96FA020(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC18HealthExperienceUI36CalendarDatePickerCollectionViewCell)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  _s18HealthExperienceUI36CalendarDatePickerCollectionViewCellC5coderACSgSo7NSCoderC_tcfc_0();
}

- (void)pickerDateChanged:(id)a3
{
  id v4;
  _TtC18HealthExperienceUI36CalendarDatePickerCollectionViewCell *v5;

  v4 = a3;
  v5 = self;
  sub_1A96FAA04(v4);

}

- (void).cxx_destruct
{
  sub_1A9643C10((uint64_t)self + OBJC_IVAR____TtC18HealthExperienceUI36CalendarDatePickerCollectionViewCell_item, (unint64_t *)&qword_1ED27B9E0, (void (*)(uint64_t))sub_1A96184A8);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC18HealthExperienceUI36CalendarDatePickerCollectionViewCell_datePicker));
}

@end
