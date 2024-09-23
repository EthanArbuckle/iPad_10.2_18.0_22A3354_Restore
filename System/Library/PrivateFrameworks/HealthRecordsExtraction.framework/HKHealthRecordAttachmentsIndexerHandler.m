@implementation HKHealthRecordAttachmentsIndexerHandler

- (void)indexWithRequest:(HKClinicalDocumentIndexingRequest *)a3 completion:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  char *v9;
  void *v10;
  _QWORD *v11;
  uint64_t v12;
  _QWORD *v13;
  _QWORD *v14;
  HKClinicalDocumentIndexingRequest *v15;
  HKHealthRecordAttachmentsIndexerHandler *v16;
  uint64_t v17;

  sub_224EF763C();
  MEMORY[0x24BDAC7A8](v7);
  v9 = (char *)&v17 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
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
  v13[4] = &unk_2557E31C0;
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

- (void)fetchSpotlightSearchResultsForQueryString:(id)a3 completion:(id)a4
{
  uint64_t v6;
  uint64_t v7;
  char *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  _QWORD *v15;
  HKHealthRecordAttachmentsIndexerHandler *v16;
  uint64_t v17;

  sub_224EF763C();
  MEMORY[0x24BDAC7A8](v6);
  v8 = (char *)&v17 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = _Block_copy(a4);
  v10 = sub_224F67B80();
  v12 = v11;
  v13 = swift_allocObject();
  *(_QWORD *)(v13 + 16) = v9;
  v14 = sub_224F67E20();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v14 - 8) + 56))(v8, 1, 1, v14);
  v15 = (_QWORD *)swift_allocObject();
  v15[2] = 0;
  v15[3] = 0;
  v15[4] = v10;
  v15[5] = v12;
  v15[6] = sub_224EF7750;
  v15[7] = v13;
  v16 = self;
  swift_bridgeObjectRetain();
  swift_retain();
  sub_224EF7270((uint64_t)v8, (uint64_t)&unk_2557E31A8, (uint64_t)v15);

  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
}

- (HKHealthRecordAttachmentsIndexerHandler)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)swift_getObjectType();
  return -[HKHealthRecordAttachmentsIndexerHandler init](&v3, sel_init);
}

@end
