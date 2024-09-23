@implementation MedicationListAllDataProvider

- (_TtC19HealthMedicationsUI29MedicationListAllDataProvider)initWithDisplayType:(id)a3 profile:(id)a4
{
  id v6;
  id v7;
  _TtC19HealthMedicationsUI29MedicationListAllDataProvider *result;

  *(Class *)((char *)&self->super.super.isa
           + OBJC_IVAR____TtC19HealthMedicationsUI29MedicationListAllDataProvider_predicate) = 0;
  v6 = a3;
  v7 = a4;

  result = (_TtC19HealthMedicationsUI29MedicationListAllDataProvider *)sub_1BC2B52B8();
  __break(1u);
  return result;
}

- (NSPredicate)defaultQueryPredicate
{
  _TtC19HealthMedicationsUI29MedicationListAllDataProvider *v2;
  id v3;

  v2 = self;
  v3 = sub_1BC2B13C8();

  return (NSPredicate *)v3;
}

- (void)setDefaultQueryPredicate:(id)a3
{
  id v3;
  id v4;

  v4 = *(Class *)((char *)&self->super.super.isa
                + OBJC_IVAR____TtC19HealthMedicationsUI29MedicationListAllDataProvider_predicate);
  *(Class *)((char *)&self->super.super.isa
           + OBJC_IVAR____TtC19HealthMedicationsUI29MedicationListAllDataProvider_predicate) = (Class)a3;
  v3 = a3;

}

- (id)textForObject:(id)a3
{
  _TtC19HealthMedicationsUI29MedicationListAllDataProvider *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  _BYTE v9[32];

  swift_unknownObjectRetain();
  v4 = self;
  sub_1BC2B5024();
  swift_unknownObjectRelease();
  sub_1BC2B15FC((uint64_t)v9);
  v6 = v5;

  __swift_destroy_boxed_opaque_existential_0((uint64_t)v9);
  if (!v6)
    return 0;
  v7 = (void *)sub_1BC2B4430();
  swift_bridgeObjectRelease();
  return v7;
}

- (id)sampleTypes
{
  uint64_t v3;
  _TtC19HealthMedicationsUI29MedicationListAllDataProvider *v4;
  HKDisplayType *v5;
  id v6;
  void *v7;

  sub_1BC0E7940();
  v3 = swift_allocObject();
  *(_OWORD *)(v3 + 16) = xmmword_1BC2B7770;
  v4 = self;
  v5 = -[WDSampleListDataProvider displayType](v4, sel_displayType);
  v6 = -[HKDisplayType sampleType](v5, sel_sampleType);

  *(_QWORD *)(v3 + 32) = v6;
  sub_1BC2B45A4();

  sub_1BC0E1D38(0, &qword_1EF3F9950);
  v7 = (void *)sub_1BC2B4580();
  swift_bridgeObjectRelease();
  return v7;
}

- (id)viewControllerForItemAtIndexPath:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  _TtC19HealthMedicationsUI29MedicationListAllDataProvider *v8;
  void *v9;
  uint64_t v11;

  v4 = sub_1BC2B2600();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x1E0C80A78](v4);
  v7 = (char *)&v11 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1BC2B25D0();
  v8 = self;
  v9 = (void *)sub_1BC2B18BC();

  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  return v9;
}

- (id)detailSectionForSample:(id)a3
{
  id v4;
  _TtC19HealthMedicationsUI29MedicationListAllDataProvider *v5;
  id v6;
  id v7;
  void *v8;
  objc_class *v9;
  char *v10;
  id v11;
  _TtC19HealthMedicationsUI29MedicationListAllDataProvider *v12;
  objc_super v14;

  v4 = a3;
  v5 = self;
  v6 = -[WDSampleListDataProvider displayTypeController](v5, sel_displayTypeController);
  v7 = -[WDSampleListDataProvider unitController](v5, sel_unitController);
  v8 = *(Class *)((char *)&v5->super.super.isa
                + OBJC_IVAR____TtC19HealthMedicationsUI29MedicationListAllDataProvider_medication);
  v9 = (objc_class *)type metadata accessor for MedicationDoseEventMetadataDetailSection();
  v10 = (char *)objc_allocWithZone(v9);
  *(_QWORD *)&v10[OBJC_IVAR____TtC19HealthMedicationsUI40MedicationDoseEventMetadataDetailSection_medication] = v8;
  v14.receiver = v10;
  v14.super_class = v9;
  v11 = v8;
  v12 = -[MedicationListAllDataProvider initWithSample:displayTypeController:unitController:](&v14, sel_initWithSample_displayTypeController_unitController_, v4, v6, v7);

  return v12;
}

- (_TtC19HealthMedicationsUI29MedicationListAllDataProvider)init
{
  _TtC19HealthMedicationsUI29MedicationListAllDataProvider *result;

  result = (_TtC19HealthMedicationsUI29MedicationListAllDataProvider *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC19HealthMedicationsUI29MedicationListAllDataProvider_medication));
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC19HealthMedicationsUI29MedicationListAllDataProvider_predicate));
}

@end
