@implementation MedicalRecordChartabilityDeterminer

- (void)determineChartabilityForConcept:(id)a3 records:(id)a4 completion:(id)a5
{
  void *v7;
  unint64_t v8;
  id v9;
  _TtC15HealthRecordsUI35MedicalRecordChartabilityDeterminer *v10;
  uint64_t v11;
  _QWORD v12[3];
  _QWORD v13[5];

  v7 = _Block_copy(a5);
  sub_1BC34B6A0(0, &qword_1ED6A52D8);
  v8 = sub_1BC62C878();
  v12[2] = v7;
  v13[3] = sub_1BC34B6A0(0, (unint64_t *)&qword_1EF4294F8);
  v13[4] = &protocol witness table for HKConcept;
  v13[0] = a3;
  v9 = a3;
  v10 = self;
  v11 = sub_1BC3D1F38(v8);
  (*(void (**)(_QWORD *, uint64_t, uint64_t, _QWORD, uint64_t (*)(), _QWORD *))((*MEMORY[0x1E0DEEDD8] & (uint64_t)v10->super.isa)
                                                                                      + 0x60))(v13, v11, 2, 0, sub_1BC3DDB7C, v12);
  swift_bridgeObjectRelease();
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v13);
  _Block_release(v7);

  swift_bridgeObjectRelease();
}

- (void)determineChartabilityForUserConcept:(id)a3 records:(id)a4 completion:(id)a5
{
  void *v7;
  unint64_t v8;
  id v9;
  _TtC15HealthRecordsUI35MedicalRecordChartabilityDeterminer *v10;
  uint64_t v11;
  _QWORD v12[3];
  _QWORD v13[5];

  v7 = _Block_copy(a5);
  sub_1BC34B6A0(0, &qword_1ED6A52D8);
  v8 = sub_1BC62C878();
  v12[2] = v7;
  v13[3] = sub_1BC34B6A0(0, (unint64_t *)&qword_1ED6A4938);
  v13[4] = &protocol witness table for HKMedicalUserDomainConcept;
  v13[0] = a3;
  v9 = a3;
  v10 = self;
  v11 = sub_1BC3D1F38(v8);
  (*(void (**)(_QWORD *, uint64_t, uint64_t, _QWORD, uint64_t (*)(), _QWORD *))((*MEMORY[0x1E0DEEDD8] & (uint64_t)v10->super.isa)
                                                                                      + 0x60))(v13, v11, 2, 0, sub_1BC3DD9EC, v12);
  swift_bridgeObjectRelease();
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v13);
  _Block_release(v7);

  swift_bridgeObjectRelease();
}

- (_TtC15HealthRecordsUI35MedicalRecordChartabilityDeterminer)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for MedicalRecordChartabilityDeterminer();
  return -[MedicalRecordChartabilityDeterminer init](&v3, sel_init);
}

@end
