@implementation CompactDatePickerTableViewCell

- (_TtC18HealthExperienceUI30CompactDatePickerTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
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
  return (_TtC18HealthExperienceUI30CompactDatePickerTableViewCell *)CompactDatePickerTableViewCell.init(style:reuseIdentifier:)(a3, (uint64_t)a4, v6);
}

- (_TtC18HealthExperienceUI30CompactDatePickerTableViewCell)initWithCoder:(id)a3
{
  char *v4;
  id v5;
  _TtC18HealthExperienceUI30CompactDatePickerTableViewCell *result;

  v4 = (char *)self + OBJC_IVAR____TtC18HealthExperienceUI30CompactDatePickerTableViewCell_item;
  *(_OWORD *)v4 = 0u;
  *((_OWORD *)v4 + 1) = 0u;
  *((_QWORD *)v4 + 4) = 0;
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC18HealthExperienceUI30CompactDatePickerTableViewCell____lazy_storage___containerView) = 0;
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC18HealthExperienceUI30CompactDatePickerTableViewCell____lazy_storage___titleLabel) = 0;
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC18HealthExperienceUI30CompactDatePickerTableViewCell____lazy_storage___compactPicker) = 0;
  v5 = a3;

  result = (_TtC18HealthExperienceUI30CompactDatePickerTableViewCell *)sub_1A9A96970();
  __break(1u);
  return result;
}

- (void)compactDatePickerView:(id)a3 didChangeValue:(id)a4
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  id v10;
  _TtC18HealthExperienceUI30CompactDatePickerTableViewCell *v11;
  uint64_t v12;

  v6 = sub_1A9A92014();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x1E0C80A78](v6);
  v9 = (char *)&v12 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1A9A91FF0();
  v10 = a3;
  v11 = self;
  sub_1A98AC5B8((uint64_t)v9);

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
}

- (CGPoint)accessibilityActivationPoint
{
  _TtC18HealthExperienceUI30CompactDatePickerTableViewCell *v2;
  id v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  CGPoint result;

  v2 = self;
  v3 = sub_1A98ABA10();
  objc_msgSend(v3, sel_accessibilityActivationPoint);
  v5 = v4;
  v7 = v6;

  v8 = v5;
  v9 = v7;
  result.y = v9;
  result.x = v8;
  return result;
}

- (void).cxx_destruct
{
  sub_1A961F39C((uint64_t)self + OBJC_IVAR____TtC18HealthExperienceUI30CompactDatePickerTableViewCell_item, (unint64_t *)&qword_1ED27B9E0, (unint64_t *)&qword_1ED27B9D0);
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC18HealthExperienceUI30CompactDatePickerTableViewCell____lazy_storage___containerView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC18HealthExperienceUI30CompactDatePickerTableViewCell____lazy_storage___titleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC18HealthExperienceUI30CompactDatePickerTableViewCell____lazy_storage___compactPicker));
}

@end
