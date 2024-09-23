@implementation MedicationDoseDaySummaryProvider

- (void)dealloc
{
  uint64_t v3;
  void *v4;
  _TtC27HealthMedicationsExperience32MedicationDoseDaySummaryProvider *v5;
  _TtC27HealthMedicationsExperience32MedicationDoseDaySummaryProvider *v6;
  objc_super v7;

  v3 = *(uint64_t *)((char *)&self->super.isa
                  + OBJC_IVAR____TtC27HealthMedicationsExperience32MedicationDoseDaySummaryProvider_observerQuery);
  if (v3)
  {
    v4 = *(Class *)((char *)&self->super.isa
                  + OBJC_IVAR____TtC27HealthMedicationsExperience32MedicationDoseDaySummaryProvider_healthStore);
    v5 = self;
    objc_msgSend(v4, sel_stopQuery_, v3);
  }
  else
  {
    v6 = self;
  }
  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for MedicationDoseDaySummaryProvider();
  -[MedicationDoseDaySummaryProvider dealloc](&v7, sel_dealloc);
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;

  v3 = (char *)self + OBJC_IVAR____TtC27HealthMedicationsExperience32MedicationDoseDaySummaryProvider__daySummary;
  sub_1BCB1FA20(0, &qword_1EDA13D08, MEMORY[0x1E0C96198]);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC27HealthMedicationsExperience32MedicationDoseDaySummaryProvider_healthStore));
  v5 = (char *)self + OBJC_IVAR____TtC27HealthMedicationsExperience32MedicationDoseDaySummaryProvider_date;
  v6 = sub_1BCB63B3C();
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v6 - 8) + 8))(v5, v6);
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC27HealthMedicationsExperience32MedicationDoseDaySummaryProvider_scheduleControl));
  swift_release();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC27HealthMedicationsExperience32MedicationDoseDaySummaryProvider_observerQuery));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC27HealthMedicationsExperience32MedicationDoseDaySummaryProvider_doseEventPredicate));
}

- (NSString)debugDescription
{
  _TtC27HealthMedicationsExperience32MedicationDoseDaySummaryProvider *v3;
  void *v4;

  swift_getObjectType();
  v3 = self;
  sub_1BCB64B14();
  sub_1BCB641F0();
  swift_bridgeObjectRelease();
  sub_1BCB641F0();
  sub_1BCB64898();

  v4 = (void *)sub_1BCB6410C();
  swift_bridgeObjectRelease();
  return (NSString *)v4;
}

- (_TtC27HealthMedicationsExperience32MedicationDoseDaySummaryProvider)init
{
  _TtC27HealthMedicationsExperience32MedicationDoseDaySummaryProvider *result;

  result = (_TtC27HealthMedicationsExperience32MedicationDoseDaySummaryProvider *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void)scheduleControlDidRescheduleItems
{
  uint64_t (*v3)(uint64_t);
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  _QWORD *v8;
  _TtC27HealthMedicationsExperience32MedicationDoseDaySummaryProvider *v9;
  uint64_t v10;

  v3 = (uint64_t (*)(uint64_t))MEMORY[0x1E0DF0750];
  sub_1BCAFC448(0, (unint64_t *)&unk_1EDA14470, (uint64_t (*)(uint64_t))MEMORY[0x1E0DF0750], (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x1E0DEB940]);
  MEMORY[0x1E0C80A78](v4);
  v6 = (char *)&v10 - v5;
  v7 = sub_1BCB643B8();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 56))(v6, 1, 1, v7);
  v8 = (_QWORD *)swift_allocObject();
  v8[2] = 0;
  v8[3] = 0;
  v8[4] = self;
  v9 = self;
  sub_1BCB1A334((uint64_t)v6, (uint64_t)&unk_1EF487B50, (uint64_t)v8);
  swift_release();
  sub_1BCAFC62C((uint64_t)v6, (unint64_t *)&unk_1EDA14470, v3);

}

@end
