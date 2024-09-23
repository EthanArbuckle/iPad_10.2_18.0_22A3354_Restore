@implementation HealthRecordsIngestionServiceServer

- (_TtC19HealthRecordsDaemon35HealthRecordsIngestionServiceServer)init
{
  _TtC19HealthRecordsDaemon35HealthRecordsIngestionServiceServer *result;

  result = (_TtC19HealthRecordsDaemon35HealthRecordsIngestionServiceServer *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC19HealthRecordsDaemon35HealthRecordsIngestionServiceServer_client));
}

- (void)remote_parseSignedClinicalData:(id)a3 options:(unint64_t)a4 completion:(id)a5
{
  sub_21FBC6C94(self, (int)a2, a3, a4, a5, (uint64_t)&unk_24E48D4D8, (uint64_t)sub_21FBC988C, sub_21FBC4A98);
}

- (void)remote_handleSignedClinicalDataFeature:(id)a3 context:(id)a4 completion:(id)a5
{
  void *v8;
  uint64_t v9;
  id v10;
  id v11;
  _TtC19HealthRecordsDaemon35HealthRecordsIngestionServiceServer *v12;

  v8 = _Block_copy(a5);
  v9 = swift_allocObject();
  *(_QWORD *)(v9 + 16) = v8;
  v10 = a3;
  v11 = a4;
  v12 = self;
  sub_21FBC4E50(v10, v11, (uint64_t)sub_21FBC988C, v9);

  swift_release();
}

- (void)remote_processOriginalSignedClinicalDataRecords:(id)a3 options:(unint64_t)a4 completion:(id)a5
{
  void *v7;
  uint64_t v8;
  uint64_t v9;
  _TtC19HealthRecordsDaemon35HealthRecordsIngestionServiceServer *v10;

  v7 = _Block_copy(a5);
  sub_21FA5BE58(0, &qword_25554BB18);
  v8 = sub_21FC5B7A8();
  v9 = swift_allocObject();
  *(_QWORD *)(v9 + 16) = v7;
  v10 = self;
  sub_21FBC5D5C(v8, a4, (uint64_t)sub_21FBC988C, v9);

  swift_bridgeObjectRelease();
  swift_release();
}

- (void)remote_reverifySignatureForRecord:(id)a3 options:(unint64_t)a4 completion:(id)a5
{
  sub_21FBC6C94(self, (int)a2, a3, a4, a5, (uint64_t)&unk_24E48D348, (uint64_t)sub_21FAD9020, sub_21FBC6268);
}

- (void)remote_addCardToWalletForRecord:(id)a3 completion:(id)a4
{
  void *v6;
  uint64_t v7;
  id v8;
  _TtC19HealthRecordsDaemon35HealthRecordsIngestionServiceServer *v9;

  v6 = _Block_copy(a4);
  v7 = swift_allocObject();
  *(_QWORD *)(v7 + 16) = v6;
  v8 = a3;
  v9 = self;
  sub_21FBC6D34(v8, (uint64_t)sub_21FAE8E90, v7);

  swift_release();
}

- (void)remote_didUpdateSignedClinicalDataRecord:(id)a3
{
  id v4;
  _TtC19HealthRecordsDaemon35HealthRecordsIngestionServiceServer *v5;

  v4 = a3;
  v5 = self;
  sub_21FBC736C(v4);

}

- (void)remote_willDeleteSignedClinicalDataRecordWithSyncIdentifier:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  _TtC19HealthRecordsDaemon35HealthRecordsIngestionServiceServer *v8;
  uint64_t v9;

  v4 = sub_21FC5AAF4();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)&v9 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_21FC5AADC();
  v8 = self;
  sub_21FBC7A7C((uint64_t)v7);

  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

- (void)remote_triggerDownloadIssuerRegistryWithOptions:(unint64_t)a3 completion:(id)a4
{
  sub_21FBC8FB4(self, (int)a2, a3, a4, (uint64_t)&unk_24E48D190, (uint64_t)sub_21FBC9368, (void (*)(uint64_t, uint64_t, uint64_t))sub_21FBC8210);
}

- (void)remote_triggerDownloadPublicKeysWithOptions:(unint64_t)a3 completion:(id)a4
{
  sub_21FBC8FB4(self, (int)a2, a3, a4, (uint64_t)&unk_24E48D118, (uint64_t)sub_21FBC9118, (void (*)(uint64_t, uint64_t, uint64_t))sub_21FBC860C);
}

- (id)exportedInterface
{
  return (id)HDHealthRecordsIngestionServiceInterface();
}

- (id)remoteInterface
{
  return 0;
}

@end
