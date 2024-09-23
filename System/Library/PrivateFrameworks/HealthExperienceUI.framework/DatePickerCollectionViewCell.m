@implementation DatePickerCollectionViewCell

- (_TtC18HealthExperienceUI28DatePickerCollectionViewCell)initWithFrame:(CGRect)a3
{
  return (_TtC18HealthExperienceUI28DatePickerCollectionViewCell *)sub_1A9A75100(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC18HealthExperienceUI28DatePickerCollectionViewCell)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  _s18HealthExperienceUI28DatePickerCollectionViewCellC5coderACSgSo7NSCoderC_tcfc_0();
}

- (void)pickerDateChanged:(id)a3
{
  id v4;
  _TtC18HealthExperienceUI28DatePickerCollectionViewCell *v5;

  v4 = a3;
  v5 = self;
  sub_1A9A767EC(v4);

}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  sub_1A9643C10((uint64_t)self + OBJC_IVAR____TtC18HealthExperienceUI28DatePickerCollectionViewCell_item, (unint64_t *)&qword_1ED27B9E0, (void (*)(uint64_t))sub_1A96184A8);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC18HealthExperienceUI28DatePickerCollectionViewCell_titleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC18HealthExperienceUI28DatePickerCollectionViewCell_selectedDateLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC18HealthExperienceUI28DatePickerCollectionViewCell_datePicker));
  swift_bridgeObjectRelease();
}

@end
