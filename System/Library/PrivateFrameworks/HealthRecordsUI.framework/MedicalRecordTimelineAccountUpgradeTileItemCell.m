@implementation MedicalRecordTimelineAccountUpgradeTileItemCell

- (_TtC15HealthRecordsUI47MedicalRecordTimelineAccountUpgradeTileItemCell)initWithFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  char *v7;
  objc_super v9;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v7 = (char *)self + OBJC_IVAR____TtC15HealthRecordsUI47MedicalRecordTimelineAccountUpgradeTileItemCell_item;
  *(_OWORD *)v7 = 0u;
  *((_OWORD *)v7 + 1) = 0u;
  *((_QWORD *)v7 + 4) = 0;
  *((_BYTE *)&self->super.super.super.super.super.super.isa
  + OBJC_IVAR____TtC15HealthRecordsUI47MedicalRecordTimelineAccountUpgradeTileItemCell_hasRegisteredForNotifications) = 0;
  *(Class *)((char *)&self->super.super.super.super.super.super.isa
           + OBJC_IVAR____TtC15HealthRecordsUI47MedicalRecordTimelineAccountUpgradeTileItemCell_tileView) = 0;
  v9.receiver = self;
  v9.super_class = (Class)type metadata accessor for MedicalRecordTimelineAccountUpgradeTileItemCell();
  return -[MedicalRecordTimelineAccountUpgradeTileItemCell initWithFrame:](&v9, sel_initWithFrame_, x, y, width, height);
}

- (_TtC15HealthRecordsUI47MedicalRecordTimelineAccountUpgradeTileItemCell)initWithCoder:(id)a3
{
  char *v4;
  objc_super v6;

  v4 = (char *)self + OBJC_IVAR____TtC15HealthRecordsUI47MedicalRecordTimelineAccountUpgradeTileItemCell_item;
  *(_OWORD *)v4 = 0u;
  *((_OWORD *)v4 + 1) = 0u;
  *((_QWORD *)v4 + 4) = 0;
  *((_BYTE *)&self->super.super.super.super.super.super.isa
  + OBJC_IVAR____TtC15HealthRecordsUI47MedicalRecordTimelineAccountUpgradeTileItemCell_hasRegisteredForNotifications) = 0;
  *(Class *)((char *)&self->super.super.super.super.super.super.isa
           + OBJC_IVAR____TtC15HealthRecordsUI47MedicalRecordTimelineAccountUpgradeTileItemCell_tileView) = 0;
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for MedicalRecordTimelineAccountUpgradeTileItemCell();
  return -[MedicalRecordTimelineAccountUpgradeTileItemCell initWithCoder:](&v6, sel_initWithCoder_, a3);
}

- (UICellConfigurationState)_bridgedConfigurationState
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  _TtC15HealthRecordsUI47MedicalRecordTimelineAccountUpgradeTileItemCell *v7;
  void *v8;
  uint64_t v10;

  v3 = sub_1BC62BC18();
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x1E0C80A78](v3);
  v6 = (char *)&v10 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = self;
  sub_1BC43FD3C();

  v8 = (void *)sub_1BC62BC00();
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  return (UICellConfigurationState *)v8;
}

- (void)_bridgedUpdateConfigurationUsingState:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  _TtC15HealthRecordsUI47MedicalRecordTimelineAccountUpgradeTileItemCell *v8;
  uint64_t v9;

  v4 = sub_1BC62BC18();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x1E0C80A78](v4);
  v7 = (char *)&v9 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1BC62BC0C();
  v8 = self;
  sub_1BC4405AC();

  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

- (void)reloadDataSource
{
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  _TtC15HealthRecordsUI47MedicalRecordTimelineAccountUpgradeTileItemCell *v7;
  uint64_t v8;
  _QWORD *v9;
  uint64_t v10;
  uint64_t v11;

  sub_1BC384E68(0, (unint64_t *)&qword_1ED6A4DE0, (void (*)(uint64_t))MEMORY[0x1E0DF0750]);
  MEMORY[0x1E0C80A78](v3);
  v5 = (char *)&v11 - v4;
  v6 = sub_1BC62C95C();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 56))(v5, 1, 1, v6);
  sub_1BC62C944();
  v7 = self;
  v8 = sub_1BC62C938();
  v9 = (_QWORD *)swift_allocObject();
  v10 = MEMORY[0x1E0DF06E8];
  v9[2] = v8;
  v9[3] = v10;
  v9[4] = v7;
  sub_1BC5C28D8((uint64_t)v5, (uint64_t)&unk_1EF42FFF8, (uint64_t)v9);

  swift_release();
}

- (void)upgradeAction
{
  _TtC15HealthRecordsUI47MedicalRecordTimelineAccountUpgradeTileItemCell *v2;

  v2 = self;
  sub_1BC4408D0();

}

- (void)dismissAction
{
  _TtC15HealthRecordsUI47MedicalRecordTimelineAccountUpgradeTileItemCell *v2;

  v2 = self;
  sub_1BC440D90();

}

- (void).cxx_destruct
{
  sub_1BC384EB4((uint64_t)self + OBJC_IVAR____TtC15HealthRecordsUI47MedicalRecordTimelineAccountUpgradeTileItemCell_item, (unint64_t *)&qword_1EF43AE70, (void (*)(uint64_t))sub_1BC37AE0C);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC15HealthRecordsUI47MedicalRecordTimelineAccountUpgradeTileItemCell_tileView));
}

@end
