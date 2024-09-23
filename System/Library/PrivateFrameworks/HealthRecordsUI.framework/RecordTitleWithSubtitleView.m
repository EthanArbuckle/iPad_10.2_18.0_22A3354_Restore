@implementation RecordTitleWithSubtitleView

- (_TtC15HealthRecordsUI27RecordTitleWithSubtitleView)initWithFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  char *v8;
  objc_class *v9;
  _TtC15HealthRecordsUI27RecordTitleWithSubtitleView *v10;
  objc_super v12;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  *((_BYTE *)&self->super.super.super.super.isa
  + OBJC_IVAR____TtC15HealthRecordsUI27RecordTitleWithSubtitleView_needsToLayoutFirstHeader) = 0;
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC15HealthRecordsUI27RecordTitleWithSubtitleView____lazy_storage___recordsHeadingLabel) = 0;
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC15HealthRecordsUI27RecordTitleWithSubtitleView____lazy_storage___titleLabel) = 0;
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC15HealthRecordsUI27RecordTitleWithSubtitleView____lazy_storage___subtitleLabel) = 0;
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC15HealthRecordsUI27RecordTitleWithSubtitleView_customConstraints) = (Class)MEMORY[0x1E0DEE9D8];
  v8 = (char *)self + OBJC_IVAR____TtC15HealthRecordsUI27RecordTitleWithSubtitleView_item;
  v9 = (objc_class *)type metadata accessor for RecordTitleWithSubtitleView();
  *(_OWORD *)v8 = 0u;
  *((_OWORD *)v8 + 1) = 0u;
  *((_QWORD *)v8 + 4) = 0;
  v12.receiver = self;
  v12.super_class = v9;
  v10 = -[RecordTitleWithSubtitleView initWithFrame:](&v12, sel_initWithFrame_, x, y, width, height);
  sub_1BC5715A4();

  return v10;
}

- (_TtC15HealthRecordsUI27RecordTitleWithSubtitleView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1BC5724AC();
}

- (void)traitCollectionDidChange:(id)a3
{
  id v5;
  _TtC15HealthRecordsUI27RecordTitleWithSubtitleView *v6;

  v5 = a3;
  v6 = self;
  sub_1BC5716E8(a3);

}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC15HealthRecordsUI27RecordTitleWithSubtitleView____lazy_storage___recordsHeadingLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC15HealthRecordsUI27RecordTitleWithSubtitleView____lazy_storage___titleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC15HealthRecordsUI27RecordTitleWithSubtitleView____lazy_storage___subtitleLabel));
  swift_bridgeObjectRelease();
  sub_1BC37AE60((uint64_t)self + OBJC_IVAR____TtC15HealthRecordsUI27RecordTitleWithSubtitleView_item);
}

@end
