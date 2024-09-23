@implementation RecentUDCCell

- (_TtC15HealthRecordsUI13RecentUDCCell)initWithFrame:(CGRect)a3
{
  return (_TtC15HealthRecordsUI13RecentUDCCell *)sub_1BC5E7D00(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC15HealthRecordsUI13RecentUDCCell)initWithCoder:(id)a3
{
  return (_TtC15HealthRecordsUI13RecentUDCCell *)sub_1BC5E8078(a3);
}

- (void)awakeFromNib
{
  _TtC15HealthRecordsUI13RecentUDCCell *v2;

  v2 = self;
  sub_1BC5E81F4();

}

- (void)layoutSubviews
{
  id v2;
  id v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for RecentUDCCell();
  v2 = v4.receiver;
  -[RecentUDCCell layoutSubviews](&v4, sel_layoutSubviews);
  sub_1BC62A988();
  v3 = (id)*MEMORY[0x1E0CD2A68];
  sub_1BC62CDF4();

}

- (void)_bridgedUpdateConfigurationUsingState:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  _TtC15HealthRecordsUI13RecentUDCCell *v8;
  uint64_t v9;

  v4 = sub_1BC62BC18();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x1E0C80A78](v4);
  v7 = (char *)&v9 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1BC62BC0C();
  v8 = self;
  sub_1BC43E7FC((uint64_t)v7);

  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

- (void)showDetailViewController:(id)a3 viewController:(id)a4
{
  id v6;
  _TtC15HealthRecordsUI13RecentUDCCell *v7;
  id v8;
  _TtC15HealthRecordsUI13RecentUDCCell *v9;
  _OWORD v10[2];

  if (a3)
  {
    v6 = a4;
    v7 = self;
    swift_unknownObjectRetain();
    sub_1BC62D088();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v10, 0, sizeof(v10));
    v8 = a4;
    v9 = self;
  }
  sub_1BC5EA6B4((uint64_t)v10, a4);

  sub_1BC3801D0((uint64_t)v10, (uint64_t)&qword_1ED6A4840, MEMORY[0x1E0DEE9B8] + 8, (uint64_t)MEMORY[0x1E0DEB940], (uint64_t (*)(_QWORD))sub_1BC34B508);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC15HealthRecordsUI13RecentUDCCell____lazy_storage___store));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC15HealthRecordsUI13RecentUDCCell_titleView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC15HealthRecordsUI13RecentUDCCell_valueView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC15HealthRecordsUI13RecentUDCCell____lazy_storage___button));
  swift_bridgeObjectRelease();
  sub_1BC3801D0((uint64_t)self + OBJC_IVAR____TtC15HealthRecordsUI13RecentUDCCell_item, (uint64_t)&qword_1EF43AE70, (uint64_t)&qword_1EF42ADC0, MEMORY[0x1E0D2A060], (uint64_t (*)(_QWORD))sub_1BC3A9C44);
  sub_1BC3AA0C8((uint64_t)self + OBJC_IVAR____TtC15HealthRecordsUI13RecentUDCCell_sectionContext);
}

@end
