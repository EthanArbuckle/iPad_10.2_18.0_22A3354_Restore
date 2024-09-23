@implementation HKMCPregnancyDatesFactory

+ (int64_t)recentPregnancyEndThresholdInDays
{
  return 28;
}

+ (int64_t)recentPregnancyStartThresholdInDays
{
  return 21;
}

- (HKMCPregnancyDatesFactory)initWithPregnancySample:(id)a3 state:(int64_t)a4
{
  id v4;
  objc_super v6;

  *(Class *)((char *)&self->super.isa + OBJC_IVAR___HKMCPregnancyDatesFactory_pregnancySample) = (Class)a3;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___HKMCPregnancyDatesFactory_state) = (Class)a4;
  v6.receiver = self;
  v6.super_class = (Class)HKMCPregnancyDatesFactory;
  v4 = a3;
  return -[HKMCPregnancyDatesFactory init](&v6, sel_init);
}

+ (id)calculatePregnancyStartForEstimatedDueDate:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  char *v9;
  void (*v10)(char *, uint64_t);
  void *v11;
  uint64_t v13;

  v3 = sub_19A352FD4();
  v4 = *(_QWORD *)(v3 - 8);
  v5 = MEMORY[0x1E0C80A78](v3);
  v7 = (char *)&v13 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v5);
  v9 = (char *)&v13 - v8;
  sub_19A352FA4();
  sub_19A352F50();
  v10 = *(void (**)(char *, uint64_t))(v4 + 8);
  v10(v7, v3);
  v11 = (void *)sub_19A352F5C();
  v10(v9, v3);
  return v11;
}

+ (int64_t)estimatedDueDateNumberOfDays
{
  return 280;
}

+ (id)gestationalAgeStringOnDate:(id)a3 pregnancySample:(id)a4
{
  return sub_19A321420((uint64_t)a1, (uint64_t)a2, (uint64_t)a3, a4, (SEL *)&selRef_gestationalAgeStringOnDate_pregnancyStartDate_startTimeZoneName_);
}

+ (id)gestationalAgeStringOnDate:(id)a3 pregnancyStartDate:(id)a4 startTimeZoneName:(id)a5
{
  return sub_19A321550((uint64_t)a1, (uint64_t)a2, (uint64_t)a3, (uint64_t)a4, (uint64_t)a5, (void (*)(char *, char *, uint64_t, uint64_t))_sSo25HKMCPregnancyDatesFactoryC9HealthKitE20gestationalAgeString2on14pregnancyStart17startTimeZoneNameSS10Foundation4DateV_AJSStFZ_0);
}

+ (id)gestationalAgeCompactStringOnDate:(id)a3 pregnancySample:(id)a4
{
  return sub_19A321420((uint64_t)a1, (uint64_t)a2, (uint64_t)a3, a4, (SEL *)&selRef_gestationalAgeCompactStringOnDate_pregnancyStartDate_startTimeZoneName_);
}

+ (id)gestationalAgeCompactStringOnDate:(id)a3 pregnancyStartDate:(id)a4 startTimeZoneName:(id)a5
{
  return sub_19A321550((uint64_t)a1, (uint64_t)a2, (uint64_t)a3, (uint64_t)a4, (uint64_t)a5, (void (*)(char *, char *, uint64_t, uint64_t))_sSo25HKMCPregnancyDatesFactoryC9HealthKitE27gestationalAgeCompactString2on14pregnancyStart17startTimeZoneNameSS10Foundation4DateV_AJSStFZ_0);
}

+ (id)gestationalAgeInComponentsOnDate:(id)a3 pregnancyStartDate:(id)a4 startTimeZoneName:(id)a5
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  unint64_t v19;
  unint64_t v20;
  uint64_t v21;
  uint64_t v22;
  unsigned int (*v23)(char *, uint64_t, uint64_t);
  uint64_t v24;
  void (*v25)(char *, uint64_t);
  void *v27;
  uint64_t v28;

  v5 = sub_19A352FD4();
  v6 = *(_QWORD *)(v5 - 8);
  v7 = MEMORY[0x1E0C80A78](v5);
  v9 = (char *)&v28 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v7);
  v11 = (char *)&v28 - v10;
  sub_19A30FA98(0, (unint64_t *)&qword_1EE397F30, (uint64_t (*)(uint64_t))MEMORY[0x1E0CAEAB0], (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x1E0DEB940]);
  v13 = MEMORY[0x1E0C80A78](v12);
  v15 = (char *)&v28 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v13);
  v17 = (char *)&v28 - v16;
  sub_19A352FA4();
  sub_19A352FA4();
  v18 = sub_19A353430();
  v20 = v19;
  type metadata accessor for HKMCPregnancyDatesFactory();
  static HKMCPregnancyDatesFactory.calculateGestationalAgeComponentsForDisplay(fromPregnancyStart:startTimeZoneName:end:)((uint64_t)v9, v18, v20, (uint64_t)v11, (uint64_t)v15);
  v21 = sub_19A352D40();
  v22 = *(_QWORD *)(v21 - 8);
  v23 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v22 + 48);
  if (v23(v15, 1, v21) == 1)
  {
    sub_19A323268((uint64_t)v15, (unint64_t *)&qword_1EE397F30, (uint64_t (*)(uint64_t))MEMORY[0x1E0CAEAB0]);
    v24 = 1;
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v22 + 32))(v17, v15, v21);
    v24 = 0;
  }
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v22 + 56))(v17, v24, 1, v21);
  swift_bridgeObjectRelease();
  v25 = *(void (**)(char *, uint64_t))(v6 + 8);
  v25(v9, v5);
  v25(v11, v5);
  if (v23(v17, 1, v21) == 1)
    return 0;
  v27 = (void *)sub_19A352CE0();
  (*(void (**)(char *, uint64_t))(v22 + 8))(v17, v21);
  return v27;
}

+ (int64_t)maximumNumberOfWeeksPregnant
{
  return 44;
}

+ (BOOL)isPregnancyDurationPhysiologicallyPossibleForPregnancyStartDate:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  char *v9;
  BOOL v10;
  void (*v11)(char *, uint64_t);
  uint64_t v13;

  v3 = sub_19A352FD4();
  v4 = *(_QWORD *)(v3 - 8);
  v5 = MEMORY[0x1E0C80A78](v3);
  v7 = (char *)&v13 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v5);
  v9 = (char *)&v13 - v8;
  sub_19A352FA4();
  sub_19A352FC8();
  v10 = _sSo25HKMCPregnancyDatesFactoryC9HealthKitE42isPregnancyDurationPhysiologicallyPossible3for16pregnancyEndDateSb10Foundation0N0V_AItFZ_0((uint64_t)v9, (uint64_t)v7);
  v11 = *(void (**)(char *, uint64_t))(v4 + 8);
  v11(v7, v3);
  v11(v9, v3);
  return v10;
}

+ (BOOL)isPregnancyDurationPhysiologicallyPossibleForPregnancyStartDate:(id)a3 pregnancyEndDate:(id)a4
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  char *v10;
  BOOL v11;
  void (*v12)(char *, uint64_t);
  uint64_t v14;

  v4 = sub_19A352FD4();
  v5 = *(_QWORD *)(v4 - 8);
  v6 = MEMORY[0x1E0C80A78](v4);
  v8 = (char *)&v14 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v6);
  v10 = (char *)&v14 - v9;
  sub_19A352FA4();
  sub_19A352FA4();
  v11 = _sSo25HKMCPregnancyDatesFactoryC9HealthKitE42isPregnancyDurationPhysiologicallyPossible3for16pregnancyEndDateSb10Foundation0N0V_AItFZ_0((uint64_t)v10, (uint64_t)v8);
  v12 = *(void (**)(char *, uint64_t))(v5 + 8);
  v12(v8, v4);
  v12(v10, v4);
  return v11;
}

+ (id)calculatePhysiologicalWashoutFromPregnancySample:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  char *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v12;

  sub_19A30FA98(0, (unint64_t *)&qword_1ECE27680, (uint64_t (*)(uint64_t))MEMORY[0x1E0CB0870], (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x1E0DEB940]);
  MEMORY[0x1E0C80A78](v4);
  v6 = (char *)&v12 - v5;
  v7 = a3;
  static HKMCPregnancyDatesFactory.calculatePhysiologicalWashout(for:)(v7, (uint64_t)v6);

  v8 = sub_19A352FD4();
  v9 = *(_QWORD *)(v8 - 8);
  v10 = 0;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v9 + 48))(v6, 1, v8) != 1)
  {
    v10 = (void *)sub_19A352F5C();
    (*(void (**)(char *, uint64_t))(v9 + 8))(v6, v8);
  }
  return v10;
}

- (HKMCPregnancyDatesFactory)init
{
  HKMCPregnancyDatesFactory *result;

  result = (HKMCPregnancyDatesFactory *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{

}

@end
