@implementation ClinicalDocumentDownloader

- (_TtC19HealthRecordsDaemon26ClinicalDocumentDownloader)init
{
  _TtC19HealthRecordsDaemon26ClinicalDocumentDownloader *result;

  result = (_TtC19HealthRecordsDaemon26ClinicalDocumentDownloader *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC19HealthRecordsDaemon26ClinicalDocumentDownloader_client));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC19HealthRecordsDaemon26ClinicalDocumentDownloader_healthStore));
  swift_release();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC19HealthRecordsDaemon26ClinicalDocumentDownloader_documentStore));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC19HealthRecordsDaemon26ClinicalDocumentDownloader_accountStore));
}

- (void)remote_beginOrResumeDownloadingAttachments:(NSArray *)a3 shouldRequestMore:(BOOL)a4 completion:(id)a5
{
  uint64_t v9;
  uint64_t v10;
  char *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  _QWORD *v15;
  _QWORD *v16;
  NSArray *v17;
  _TtC19HealthRecordsDaemon26ClinicalDocumentDownloader *v18;
  uint64_t v19;

  sub_21FADFAE4();
  MEMORY[0x24BDAC7A8](v9);
  v11 = (char *)&v19 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = _Block_copy(a5);
  v13 = swift_allocObject();
  *(_QWORD *)(v13 + 16) = a3;
  *(_BYTE *)(v13 + 24) = a4;
  *(_QWORD *)(v13 + 32) = v12;
  *(_QWORD *)(v13 + 40) = self;
  v14 = sub_21FC5B844();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v14 - 8) + 56))(v11, 1, 1, v14);
  v15 = (_QWORD *)swift_allocObject();
  v15[2] = 0;
  v15[3] = 0;
  v15[4] = &unk_2555414D0;
  v15[5] = v13;
  v16 = (_QWORD *)swift_allocObject();
  v16[2] = 0;
  v16[3] = 0;
  v16[4] = &unk_2555414D8;
  v16[5] = v15;
  v17 = a3;
  v18 = self;
  sub_21FADF7C8((uint64_t)v11, (uint64_t)&unk_2555414E0, (uint64_t)v16);
  swift_release();
}

- (void)remote_downloadAttachment:(HKMedicalDownloadableAttachment *)a3 completion:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  char *v9;
  void *v10;
  _QWORD *v11;
  uint64_t v12;
  _QWORD *v13;
  _QWORD *v14;
  HKMedicalDownloadableAttachment *v15;
  _TtC19HealthRecordsDaemon26ClinicalDocumentDownloader *v16;
  uint64_t v17;

  sub_21FADFAE4();
  MEMORY[0x24BDAC7A8](v7);
  v9 = (char *)&v17 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = _Block_copy(a4);
  v11 = (_QWORD *)swift_allocObject();
  v11[2] = a3;
  v11[3] = v10;
  v11[4] = self;
  v12 = sub_21FC5B844();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 56))(v9, 1, 1, v12);
  v13 = (_QWORD *)swift_allocObject();
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &unk_2555414B0;
  v13[5] = v11;
  v14 = (_QWORD *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_2555414B8;
  v14[5] = v13;
  v15 = a3;
  v16 = self;
  sub_21FADF7C8((uint64_t)v9, (uint64_t)&unk_2555414C0, (uint64_t)v14);
  swift_release();
}

- (void)remote_pingDownloaderWithCompletion:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  char *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  _QWORD *v12;
  _TtC19HealthRecordsDaemon26ClinicalDocumentDownloader *v13;
  uint64_t v14;

  sub_21FADFAE4();
  MEMORY[0x24BDAC7A8](v5);
  v7 = (char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = _Block_copy(a3);
  v9 = swift_allocObject();
  *(_QWORD *)(v9 + 16) = v8;
  *(_QWORD *)(v9 + 24) = self;
  v10 = sub_21FC5B844();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 56))(v7, 1, 1, v10);
  v11 = (_QWORD *)swift_allocObject();
  v11[2] = 0;
  v11[3] = 0;
  v11[4] = &unk_255541490;
  v11[5] = v9;
  v12 = (_QWORD *)swift_allocObject();
  v12[2] = 0;
  v12[3] = 0;
  v12[4] = &unk_255541498;
  v12[5] = v11;
  v13 = self;
  sub_21FADF7C8((uint64_t)v7, (uint64_t)&unk_2555414A0, (uint64_t)v12);
  swift_release();
}

- (void)remote_triggerDownloadForAttachment:(NSUUID *)a3 completion:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  char *v9;
  void *v10;
  _QWORD *v11;
  uint64_t v12;
  _QWORD *v13;
  _QWORD *v14;
  NSUUID *v15;
  _TtC19HealthRecordsDaemon26ClinicalDocumentDownloader *v16;
  uint64_t v17;

  sub_21FADFAE4();
  MEMORY[0x24BDAC7A8](v7);
  v9 = (char *)&v17 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = _Block_copy(a4);
  v11 = (_QWORD *)swift_allocObject();
  v11[2] = a3;
  v11[3] = v10;
  v11[4] = self;
  v12 = sub_21FC5B844();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 56))(v9, 1, 1, v12);
  v13 = (_QWORD *)swift_allocObject();
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &unk_255541450;
  v13[5] = v11;
  v14 = (_QWORD *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_255541460;
  v14[5] = v13;
  v15 = a3;
  v16 = self;
  sub_21FADF7C8((uint64_t)v9, (uint64_t)&unk_255540D10, (uint64_t)v14);
  swift_release();
}

- (id)exportedInterface
{
  return (id)HKClinicalDocumentDownloaderInterface();
}

- (id)remoteInterface
{
  return 0;
}

@end
