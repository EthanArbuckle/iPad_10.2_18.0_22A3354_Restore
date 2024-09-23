@implementation MedicationDoseEventMetadataDetailSection

- (_TtC19HealthMedicationsUI40MedicationDoseEventMetadataDetailSection)initWithSample:(id)a3 displayTypeController:(id)a4 unitController:(id)a5
{
  sub_1BC1DC830((uint64_t)self, (uint64_t)a2, a3, a4, a5);
}

- (_TtC19HealthMedicationsUI40MedicationDoseEventMetadataDetailSection)initWithWorkoutActivity:(id)a3 displayTypeController:(id)a4 unitController:(id)a5
{
  sub_1BC1DC830((uint64_t)self, (uint64_t)a2, a3, a4, a5);
}

- (_TtC19HealthMedicationsUI40MedicationDoseEventMetadataDetailSection)initWithWorkoutEvent:(id)a3
{
  id v3;
  _TtC19HealthMedicationsUI40MedicationDoseEventMetadataDetailSection *result;

  v3 = a3;
  sub_1BC2B51BC();
  swift_bridgeObjectRelease();
  result = (_TtC19HealthMedicationsUI40MedicationDoseEventMetadataDetailSection *)sub_1BC2B52B8();
  __break(1u);
  return result;
}

- (void)addSampleDetailValues
{
  _TtC19HealthMedicationsUI40MedicationDoseEventMetadataDetailSection *v2;

  v2 = self;
  sub_1BC1DC938();

}

- (_TtC19HealthMedicationsUI40MedicationDoseEventMetadataDetailSection)initWithMetadataObject:(id)a3 metadataDataSource:(id)a4 displayTypeController:(id)a5 unitController:(id)a6
{
  id v9;
  id v10;
  id v11;
  _TtC19HealthMedicationsUI40MedicationDoseEventMetadataDetailSection *result;

  swift_unknownObjectRetain();
  v9 = a4;
  v10 = a5;
  v11 = a6;
  result = (_TtC19HealthMedicationsUI40MedicationDoseEventMetadataDetailSection *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC19HealthMedicationsUI40MedicationDoseEventMetadataDetailSection_medication));
}

@end
