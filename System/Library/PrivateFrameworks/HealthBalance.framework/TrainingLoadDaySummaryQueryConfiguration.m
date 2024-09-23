@implementation TrainingLoadDaySummaryQueryConfiguration

- (_TtC13HealthBalance40TrainingLoadDaySummaryQueryConfiguration)init
{
  char *v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  objc_super v8;

  v3 = (char *)self + OBJC_IVAR____TtC13HealthBalance40TrainingLoadDaySummaryQueryConfiguration_gregorianCalendar;
  v4 = sub_23DC29F80();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 56))(v3, 1, 1, v4);
  v5 = (char *)self + OBJC_IVAR____TtC13HealthBalance40TrainingLoadDaySummaryQueryConfiguration_morningIndexRange;
  sub_23DBBFA18();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 56))(v5, 1, 1, v6);
  *((_BYTE *)&self->super.super.super.isa
  + OBJC_IVAR____TtC13HealthBalance40TrainingLoadDaySummaryQueryConfiguration_typeOfDataRequested) = 3;
  v8.receiver = self;
  v8.super_class = (Class)type metadata accessor for TrainingLoadDaySummaryQueryConfiguration();
  return -[HKQueryServerConfiguration init](&v8, sel_init);
}

- (id)copyWithZone:(void *)a3
{
  _TtC13HealthBalance40TrainingLoadDaySummaryQueryConfiguration *v4;
  void *v5;
  _QWORD v7[4];

  v4 = self;
  sub_23DBFC8B4((uint64_t)a3, (uint64_t)v7);

  __swift_project_boxed_opaque_existential_1(v7, v7[3]);
  v5 = (void *)sub_23DC2A7F0();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v7);
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_TtC13HealthBalance40TrainingLoadDaySummaryQueryConfiguration)initWithCoder:(id)a3
{
  return (_TtC13HealthBalance40TrainingLoadDaySummaryQueryConfiguration *)TrainingLoadDaySummaryQueryConfiguration.init(coder:)(a3);
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  _TtC13HealthBalance40TrainingLoadDaySummaryQueryConfiguration *v5;

  v4 = a3;
  v5 = self;
  sub_23DBFD328(v4);

}

- (void).cxx_destruct
{
  sub_23DBB73A8((uint64_t)self + OBJC_IVAR____TtC13HealthBalance40TrainingLoadDaySummaryQueryConfiguration_gregorianCalendar, &qword_25431F8F0, (uint64_t (*)(uint64_t))MEMORY[0x24BDCF2D8]);
  sub_23DBB73A8((uint64_t)self + OBJC_IVAR____TtC13HealthBalance40TrainingLoadDaySummaryQueryConfiguration_morningIndexRange, (unint64_t *)&qword_256CE9D38, (uint64_t (*)(uint64_t))sub_23DBBFA18);
}

@end
