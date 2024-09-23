@implementation MedicalRecordTimelinePanelItemCell

- (_TtC15HealthRecordsUI34MedicalRecordTimelinePanelItemCell)initWithFrame:(CGRect)a3
{
  return (_TtC15HealthRecordsUI34MedicalRecordTimelinePanelItemCell *)sub_1BC542AD0(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC15HealthRecordsUI34MedicalRecordTimelinePanelItemCell)initWithCoder:(id)a3
{
  return (_TtC15HealthRecordsUI34MedicalRecordTimelinePanelItemCell *)sub_1BC542D0C(a3);
}

- (void)_bridgedUpdateConfigurationUsingState:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  _TtC15HealthRecordsUI34MedicalRecordTimelinePanelItemCell *v8;
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

- (void).cxx_destruct
{
  sub_1BC37AE60((uint64_t)self + OBJC_IVAR____TtC15HealthRecordsUI34MedicalRecordTimelinePanelItemCell_item);
  sub_1BC377E3C((uint64_t)self + OBJC_IVAR____TtC15HealthRecordsUI34MedicalRecordTimelinePanelItemCell_sectionContext, &qword_1EF42BC08, (uint64_t (*)(uint64_t))MEMORY[0x1E0D2AAA0]);
}

@end
