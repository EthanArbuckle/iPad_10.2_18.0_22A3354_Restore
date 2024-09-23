@implementation HDHRSignedClinicalDataProcessor

- (id)preprocessDataInSource:(id)a3 options:(unint64_t)a4 error:(id *)a5
{
  return sub_224F01324(self, (uint64_t)a2, a3, a4, (uint64_t)a5, (uint64_t (*)(id, uint64_t))sub_224F042E4);
}

- (id)preprocessFHIRResourceObject:(id)a3 options:(unint64_t)a4 error:(id *)a5
{
  return sub_224F01324(self, (uint64_t)a2, a3, a4, (uint64_t)a5, (uint64_t (*)(id, uint64_t))sub_224F043F4);
}

- (id)reprocessOriginalRecords:(id)a3 options:(unint64_t)a4 error:(id *)a5
{
  unint64_t v7;
  HDHRSignedClinicalDataProcessor *v8;
  void *v9;

  sub_224E5451C(0, &qword_2557E3430);
  v7 = sub_224F67D6C();
  v8 = self;
  v9 = (void *)sub_224F04D30(v7, a4);
  swift_bridgeObjectRelease();

  return v9;
}

- (void)processOriginalSignedClinicalDataRecords:(NSArray *)a3 options:(unint64_t)a4 completion:(id)a5
{
  uint64_t v9;
  uint64_t v10;
  char *v11;
  void *v12;
  _QWORD *v13;
  uint64_t v14;
  _QWORD *v15;
  _QWORD *v16;
  NSArray *v17;
  HDHRSignedClinicalDataProcessor *v18;
  uint64_t v19;

  sub_224E63218(0, &qword_2557E3168, (void (*)(uint64_t))MEMORY[0x24BEE6990]);
  MEMORY[0x24BDAC7A8](v9);
  v11 = (char *)&v19 - v10;
  v12 = _Block_copy(a5);
  v13 = (_QWORD *)swift_allocObject();
  v13[2] = a3;
  v13[3] = a4;
  v13[4] = v12;
  v13[5] = self;
  v14 = sub_224F67E20();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v14 - 8) + 56))(v11, 1, 1, v14);
  v15 = (_QWORD *)swift_allocObject();
  v15[2] = 0;
  v15[3] = 0;
  v15[4] = &unk_2557E3418;
  v15[5] = v13;
  v16 = (_QWORD *)swift_allocObject();
  v16[2] = 0;
  v16[3] = 0;
  v16[4] = &unk_2557E3420;
  v16[5] = v15;
  v17 = a3;
  v18 = self;
  sub_224F450EC((uint64_t)v11, (uint64_t)&unk_2557E3428, (uint64_t)v16);
  swift_release();
}

- (void)processContextCollection:(HDHRSSignedClinicalDataProcessingContextCollection *)a3 completion:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  char *v9;
  void *v10;
  _QWORD *v11;
  uint64_t v12;
  _QWORD *v13;
  _QWORD *v14;
  HDHRSSignedClinicalDataProcessingContextCollection *v15;
  HDHRSignedClinicalDataProcessor *v16;
  uint64_t v17;

  sub_224E63218(0, &qword_2557E3168, (void (*)(uint64_t))MEMORY[0x24BEE6990]);
  MEMORY[0x24BDAC7A8](v7);
  v9 = (char *)&v17 - v8;
  v10 = _Block_copy(a4);
  v11 = (_QWORD *)swift_allocObject();
  v11[2] = a3;
  v11[3] = v10;
  v11[4] = self;
  v12 = sub_224F67E20();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 56))(v9, 1, 1, v12);
  v13 = (_QWORD *)swift_allocObject();
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &unk_2557E3408;
  v13[5] = v11;
  v14 = (_QWORD *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_2557E31C8;
  v14[5] = v13;
  v15 = a3;
  v16 = self;
  sub_224F450EC((uint64_t)v9, (uint64_t)&unk_2557E31D0, (uint64_t)v14);
  swift_release();
}

- (HDHRSignedClinicalDataProcessor)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for SignedClinicalDataProcessor();
  return -[HDHRSignedClinicalDataProcessor init](&v3, sel_init);
}

@end
