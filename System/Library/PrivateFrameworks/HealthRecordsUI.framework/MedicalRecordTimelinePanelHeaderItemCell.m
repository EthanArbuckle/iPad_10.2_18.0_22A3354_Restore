@implementation MedicalRecordTimelinePanelHeaderItemCell

- (_TtC15HealthRecordsUI40MedicalRecordTimelinePanelHeaderItemCell)initWithFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  char *v8;
  char *v9;
  uint64_t v10;
  _TtC15HealthRecordsUI40MedicalRecordTimelinePanelHeaderItemCell *v11;
  objc_super v13;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  *(Class *)((char *)&self->super.super.super.super.super.super.isa
           + OBJC_IVAR____TtC15HealthRecordsUI40MedicalRecordTimelinePanelHeaderItemCell____lazy_storage___titleLabel) = 0;
  *(Class *)((char *)&self->super.super.super.super.super.super.isa
           + OBJC_IVAR____TtC15HealthRecordsUI40MedicalRecordTimelinePanelHeaderItemCell____lazy_storage___subtitleLabel) = 0;
  *(Class *)((char *)&self->super.super.super.super.super.super.isa
           + OBJC_IVAR____TtC15HealthRecordsUI40MedicalRecordTimelinePanelHeaderItemCell_customConstraints) = (Class)MEMORY[0x1E0DEE9D8];
  v8 = (char *)self + OBJC_IVAR____TtC15HealthRecordsUI40MedicalRecordTimelinePanelHeaderItemCell_item;
  *(_OWORD *)v8 = 0u;
  *((_OWORD *)v8 + 1) = 0u;
  *((_QWORD *)v8 + 4) = 0;
  v9 = (char *)self + OBJC_IVAR____TtC15HealthRecordsUI40MedicalRecordTimelinePanelHeaderItemCell_sectionContext;
  v10 = sub_1BC62ADD8();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 56))(v9, 1, 1, v10);
  v13.receiver = self;
  v13.super_class = (Class)type metadata accessor for MedicalRecordTimelinePanelHeaderItemCell();
  v11 = -[MedicalRecordTimelinePanelHeaderItemCell initWithFrame:](&v13, sel_initWithFrame_, x, y, width, height);
  sub_1BC5B4B38();

  return v11;
}

- (_TtC15HealthRecordsUI40MedicalRecordTimelinePanelHeaderItemCell)initWithCoder:(id)a3
{
  char *v5;
  char *v6;
  uint64_t v7;
  id v8;
  _TtC15HealthRecordsUI40MedicalRecordTimelinePanelHeaderItemCell *result;

  *(Class *)((char *)&self->super.super.super.super.super.super.isa
           + OBJC_IVAR____TtC15HealthRecordsUI40MedicalRecordTimelinePanelHeaderItemCell____lazy_storage___titleLabel) = 0;
  *(Class *)((char *)&self->super.super.super.super.super.super.isa
           + OBJC_IVAR____TtC15HealthRecordsUI40MedicalRecordTimelinePanelHeaderItemCell____lazy_storage___subtitleLabel) = 0;
  *(Class *)((char *)&self->super.super.super.super.super.super.isa
           + OBJC_IVAR____TtC15HealthRecordsUI40MedicalRecordTimelinePanelHeaderItemCell_customConstraints) = (Class)MEMORY[0x1E0DEE9D8];
  v5 = (char *)self + OBJC_IVAR____TtC15HealthRecordsUI40MedicalRecordTimelinePanelHeaderItemCell_item;
  *(_OWORD *)v5 = 0u;
  *((_OWORD *)v5 + 1) = 0u;
  *((_QWORD *)v5 + 4) = 0;
  v6 = (char *)self + OBJC_IVAR____TtC15HealthRecordsUI40MedicalRecordTimelinePanelHeaderItemCell_sectionContext;
  v7 = sub_1BC62ADD8();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 56))(v6, 1, 1, v7);
  v8 = a3;

  result = (_TtC15HealthRecordsUI40MedicalRecordTimelinePanelHeaderItemCell *)sub_1BC62D394();
  __break(1u);
  return result;
}

- (void)traitCollectionDidChange:(id)a3
{
  id v5;
  _TtC15HealthRecordsUI40MedicalRecordTimelinePanelHeaderItemCell *v6;

  v5 = a3;
  v6 = self;
  sub_1BC5B4C9C(a3);

}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC15HealthRecordsUI40MedicalRecordTimelinePanelHeaderItemCell____lazy_storage___titleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC15HealthRecordsUI40MedicalRecordTimelinePanelHeaderItemCell____lazy_storage___subtitleLabel));
  swift_bridgeObjectRelease();
  sub_1BC384EB4((uint64_t)self + OBJC_IVAR____TtC15HealthRecordsUI40MedicalRecordTimelinePanelHeaderItemCell_item, (unint64_t *)&qword_1EF43AE70, (void (*)(uint64_t))sub_1BC37AE0C);
  sub_1BC384EB4((uint64_t)self + OBJC_IVAR____TtC15HealthRecordsUI40MedicalRecordTimelinePanelHeaderItemCell_sectionContext, &qword_1EF42BC08, (void (*)(uint64_t))MEMORY[0x1E0D2AAA0]);
}

@end
