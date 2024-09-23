@implementation TitleSubtitleDetailSpinnerCell

- (_TtC15HealthRecordsUI30TitleSubtitleDetailSpinnerCell)initWithFrame:(CGRect)a3
{
  return (_TtC15HealthRecordsUI30TitleSubtitleDetailSpinnerCell *)sub_1BC405450(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC15HealthRecordsUI30TitleSubtitleDetailSpinnerCell)initWithCoder:(id)a3
{
  char *v4;
  id v5;
  _TtC15HealthRecordsUI30TitleSubtitleDetailSpinnerCell *result;

  *(Class *)((char *)&self->super.super.super.super.super.isa
           + OBJC_IVAR____TtC15HealthRecordsUI30TitleSubtitleDetailSpinnerCell____lazy_storage___titleLabel) = 0;
  *(Class *)((char *)&self->super.super.super.super.super.isa
           + OBJC_IVAR____TtC15HealthRecordsUI30TitleSubtitleDetailSpinnerCell____lazy_storage___subtitleLabel) = 0;
  *(Class *)((char *)&self->super.super.super.super.super.isa
           + OBJC_IVAR____TtC15HealthRecordsUI30TitleSubtitleDetailSpinnerCell____lazy_storage___spinner) = 0;
  v4 = (char *)self + OBJC_IVAR____TtC15HealthRecordsUI30TitleSubtitleDetailSpinnerCell_item;
  *(_OWORD *)v4 = 0u;
  *((_OWORD *)v4 + 1) = 0u;
  *((_QWORD *)v4 + 4) = 0;
  v5 = a3;

  result = (_TtC15HealthRecordsUI30TitleSubtitleDetailSpinnerCell *)sub_1BC62D394();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC15HealthRecordsUI30TitleSubtitleDetailSpinnerCell____lazy_storage___titleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC15HealthRecordsUI30TitleSubtitleDetailSpinnerCell____lazy_storage___subtitleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC15HealthRecordsUI30TitleSubtitleDetailSpinnerCell____lazy_storage___spinner));
  sub_1BC37AE60((uint64_t)self + OBJC_IVAR____TtC15HealthRecordsUI30TitleSubtitleDetailSpinnerCell_item);
}

@end
