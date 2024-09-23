@implementation HKHealthRecordsExtractor

- (void)extractResource:(HDOriginalFHIRResourceObject *)a3 completion:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  char *v9;
  void *v10;
  _QWORD *v11;
  uint64_t v12;
  _QWORD *v13;
  _QWORD *v14;
  HDOriginalFHIRResourceObject *v15;
  HKHealthRecordsExtractor *v16;
  uint64_t v17;

  sub_224DDEA0C(0, &qword_2557E3168, (uint64_t (*)(uint64_t))MEMORY[0x24BEE6990], (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE1C68]);
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
  v13[4] = &unk_2557E4220;
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

- (id)comparePatientResourceDataWithExisting:(id)a3 incoming:(id)a4 error:(id *)a5
{
  id v7;
  id v8;
  HKHealthRecordsExtractor *v9;
  id v10;

  v7 = a3;
  v8 = a4;
  v9 = self;
  v10 = sub_224EED38C(v7, v8);

  return v10;
}

- (HKHealthRecordsExtractor)init
{
  uint64_t v3;
  id v4;
  HKHealthRecordsExtractor *v5;
  uint64_t v6;
  objc_super v8;

  v3 = OBJC_IVAR___HKHealthRecordsExtractor_router;
  v4 = objc_allocWithZone((Class)type metadata accessor for HealthRecordsExtractionRouter());
  v5 = self;
  *(Class *)((char *)&self->super.isa + v3) = (Class)objc_msgSend(v4, sel_init);
  v6 = OBJC_IVAR___HKHealthRecordsExtractor_decoder;
  sub_224F67298();
  swift_allocObject();
  *(Class *)((char *)&v5->super.isa + v6) = (Class)sub_224F6728C();

  v8.receiver = v5;
  v8.super_class = (Class)type metadata accessor for HealthRecordsExtractor();
  return -[HKHealthRecordsExtractor init](&v8, sel_init);
}

- (void).cxx_destruct
{

  swift_release();
}

@end
